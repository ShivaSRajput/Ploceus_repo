#RESOURCE GROUP for Linux VMs
module "resource_group" {
  source                   = "../../../resource_group/v1.0.0"
  resource_group_variables = var.resource_group_variables
}

# VNET for Linux VMs
module "vnet" {
  source          = "../../../vnet/v1.0.0"
  vnets_variables = var.vnets_variables
  depends_on      = [module.resource_group]
}

#SUBNET FOR Linux VMs
module "subnet" {
  source           = "../../../subnet/v1.0.0"
  subnet_variables = var.subnet_variables
  depends_on       = [module.vnet]
}

#PUBLIC IP for Linux VMs
module "public_ip" {
  source             = "../../../public_ip/v1.0.0"
  public_ip_variable = var.public_ip_variable
  depends_on         = [module.resource_group]
}

#KEY VAULT for Linux VMs (Disk Encryption Set, Admin SSH key)
module "key_vault" {
  source              = "../../../key_vault/v1.0.0"
  key_vault_variables = var.key_vault_variables
  depends_on          = [module.resource_group]
}

#KEY VAULT KEY for Linux VMs (Disk encryption Set)
module "key_vault_key" {
  source                  = "../../../key_vault_key/v1.0.0"
  key_vault_key_variables = var.key_vault_key_variables
  depends_on              = [module.key_vault]
}

#DISK ENCRYPTION SET
module "disk_encryption_set" {
  source                        = "../../../disk_encryption_set/v1.0.0"
  disk_encryption_set_variables = var.disk_encryption_set_variables
  depends_on                    = [module.key_vault_key]
}

#KEY VAULT ACCESS POLICY
module "key_vault_access_policy" {
  for_each                          = var.disk_encryption_set_variables
  source                            = "../../../key_vault_access_policy/kvac(diskencryption_set)/v1.0.0"
  key_vault_access_policy_variables = var.key_vault_access_policy_variables
  disk_encryption_set_key           = each.key
  tenant_id                         = module.disk_encryption_set.disk_encryption_set_tenant_id[each.key][0]
  object_id                         = module.disk_encryption_set.disk_encryption_set_principal_id[each.key][0]
  depends_on                        = [module.disk_encryption_set]
}

#STROAGE ACCOUNT for Linux VMs (Boot diagnostics)
module "storage_account" {
  source                    = "../../../storage_account/v1.0.0"
  storage_account_variables = var.storage_account_variables
  depends_on                = [module.resource_group]
}

#NETWORK SECURITY GROUP for Linux VMs
module "network_security_group" {
  source                          = "../../../network_security_group/v1.0.0"
  network_security_group_variable = var.network_security_group_variable
  depends_on                      = [module.resource_group]
}

#LINUX VMs
module "linux_vm" {
  source                          = "../"
  linux_virtual_machine_variables = var.linux_virtual_machine_variables
  linux_vm_nic_variables          = var.linux_vm_nic_variables
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

#NETWORK SECURITY GROUP ASSOCIATION for Linux VMs
module "network_security_group_association" {
  source                   = "../../../network_security_group_association/v1.0.0"
  nsg_association_variable = var.nsg_association_variable
  depends_on = [
    module.subnet,
    module.vnet,
    module.linux_vm,
    module.network_security_group
  ]
}
