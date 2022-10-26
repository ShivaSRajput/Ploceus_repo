#RESOURCE GROUP for windows VMs
module "resource_group" {
  source                   = "git@github.com:cloud-transformation/ploceus//azure/resource_group/v1.0.0?ref=main"
  resource_group_variables = var.resource_group_variables
}

# VNET for windows VMs
module "vnet" {
  source          = "git@github.com:cloud-transformation/ploceus//azure/vnet/v1.0.0?ref=main"
  vnets_variables = var.vnets_variables
  depends_on      = [module.resource_group]
}

#SUBNET FOR windows VMs
module "subnet" {
  source           = "git@github.com:cloud-transformation/ploceus//azure/subnet/v1.0.0?ref=main"
  subnet_variables = var.subnet_variables
  depends_on       = [module.vnet]
}

#PUBLIC IP for windows VMs
module "public_ip" {
  source             = "git@github.com:cloud-transformation/ploceus//azure/public_ip/v1.0.0?ref=main"
  public_ip_variable = var.public_ip_variable
  depends_on         = [module.resource_group]
}

#KEY VAULT for windows VMs (Disk Encryption Set, Admin SSH key)
module "key_vault" {
  source              = "git@github.com:cloud-transformation/ploceus//azure/key_vault/v1.0.0?ref=main"
  key_vault_variables = var.key_vault_variables
  depends_on          = [module.resource_group]
}

#KEY VAULT KEY for windows VMs (Disk encryption Set)
module "key_vault_key" {
  source                  = "git@github.com:cloud-transformation/ploceus//azure/key_vault_key/v1.0.0?ref=main"
  key_vault_key_variables = var.key_vault_key_variables
  depends_on              = [module.key_vault]
}

#DISK ENCRYPTION SET
module "disk_encryption_set" {
  source                        = "git@github.com:cloud-transformation/ploceus//azure/disk_encryption_set/v1.0.0?ref=main"
  disk_encryption_set_variables = var.disk_encryption_set_variables
  depends_on                    = [module.key_vault_key]
}

#KEY VAULT ACCESS POLICY
module "key_vault_access_policy" {
  for_each                          = var.disk_encryption_set_variables
  source                            = "git@github.com:cloud-transformation/ploceus//azure/key_vault_access_policy/kvac(diskencryption_set)/v1.0.0?ref=main"
  key_vault_access_policy_variables = var.key_vault_access_policy_variables
  disk_encryption_set_key           = each.key
  tenant_id                         = module.disk_encryption_set.disk_encryption_set_tenant_id[each.key][0]
  object_id                         = module.disk_encryption_set.disk_encryption_set_principal_id[each.key][0]
  depends_on                        = [module.disk_encryption_set]
}

#STROAGE ACCOUNT for windows VMs (Boot diagnostics)
module "storage_account" {
  source                    = "git@github.com:cloud-transformation/ploceus//azure/storage_account/v1.0.0?ref=main"
  storage_account_variables = var.storage_account_variables
  depends_on                = [module.resource_group]
}

#NETWORK SECURITY GROUP for windows VMs
module "network_security_group" {
  source                          = "git@github.com:cloud-transformation/ploceus//azure/network_security_group/v1.0.0?ref=main"
  network_security_group_variable = var.network_security_group_variable
  depends_on                      = [module.resource_group]
}

#windows VMs
module "windows_virtual_machine" {
  source                            = "git@github.com:cloud-transformation/ploceus//azure/windows_virtual_machine/v1.0.0?ref=main"
  windows_virtual_machine_variables = var.windows_virtual_machine_variables
  windows_vm_nic_variables          = var.windows_vm_nic_variables
  depends_on = [
    module.subnet,
    module.vnet,
    module.public_ip,
    module.storage_account,
    #module.application_gateway,
    module.key_vault,
    module.key_vault_key,
    module.disk_encryption_set,
    module.key_vault_access_policy
  ]
}

#NETWORK SECURITY GROUP ASSOCIATION for windows VMs
module "network_security_group_association" {
  source                   = "git@github.com:cloud-transformation/ploceus//azure/network_security_group_association/v1.0.0?ref=main"
  nsg_association_variable = var.nsg_association_variable
  depends_on = [
    module.subnet,
    module.vnet,
    module.windows_virtual_machine,
    module.network_security_group
  ]
}
