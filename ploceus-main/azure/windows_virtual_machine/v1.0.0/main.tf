#windows Virtual Mchine
locals {
  is_public_ip_exists           = { for k, v in var.windows_vm_nic_variables : k => v if lookup(v, "is_public_required", false) == true }
  is_application_gateway_exists = { for k, v in var.windows_virtual_machine_variables : k => v if lookup(v, "is_gateway_load_balancer_required_to_be_attached", false) == true }
  is_disk_encryption_set_exists = { for k, v in var.windows_virtual_machine_variables : k => v if lookup(v, "is_disk_encryption_set_required", false) == true }
  is_boot_diagnostics_exists    = { for k, v in var.windows_virtual_machine_variables : k => v if lookup(v, "is_boot_diagnostics_required", false) == true }
  is_user_identity_required     = { for k, v in var.windows_virtual_machine_variables : k => v if lookup(v, "identity_type", false) != "SystemAssigned" }
#   generate_ssh_keys             = { for k, v in var.windows_virtual_machine_variables : k => v if(lookup(v, "generate_new_ssh_key", false) == true) }
#   use_existing_ssh_keys         = { for k, v in var.windows_virtual_machine_variables : k => v if(lookup(v, "use_ssh_keys", false) == true && lookup(v, "generate_new_ssh_key", true) == false) }
}

data "azurerm_subnet" "subnet_id" {
  for_each             = var.windows_vm_nic_variables
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "public_ip" {
  for_each            = local.is_public_ip_exists
  name                = each.value.public_ip_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_application_gateway" "application_gateway" {
  for_each            = local.is_application_gateway_exists
  name                = each.value.application_gateway_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_disk_encryption_set" "disk_encryption_set" {
  for_each            = local.is_disk_encryption_set_exists
  name                = each.value.disk_encryption_set_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_storage_account" "boot_diagnostics_storage_account" {
  for_each            = local.is_boot_diagnostics_exists
  name                = each.value.boot_diagnostics_storage_account_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_user_assigned_identity" "aks_user_identity" {
  for_each            = local.is_user_identity_required
  name                = each.value.user_identity_name
  resource_group_name = each.value.resource_group_name
}

# data "azurerm_key_vault" "generate_ssh_keys_key_vault_id" {
#   for_each            = local.generate_ssh_keys
#   name                = each.value.admin_ssh_key_vault_name
#   resource_group_name = each.value.resource_group_name
# }

# #Creates new private key if generate_new_ssh_key is true
# resource "tls_private_key" "generate_ssh_keys_tls_private_key" {
#   for_each  = local.generate_ssh_keys
#   algorithm = each.value.tls_private_key_algorithm
#   rsa_bits  = each.value.tls_private_key_rsa_bits
# }

# #Add the newly created private key as a secret to a key vault for admin login purpose
# resource "azurerm_key_vault_secret" "key_vault_secret" {
#   for_each     = local.generate_ssh_keys
#   name         = each.value.admin_ssh_key_vault_secret_name
#   value        = tls_private_key.generate_ssh_keys_tls_private_key[each.key].private_key_pem
#   key_vault_id = data.azurerm_key_vault.generate_ssh_keys_key_vault_id[each.key].id
# }

# #Key Vault for existing ssh keys
# data "azurerm_key_vault" "existing_ssh_keys_key_vault_id" {
#   for_each            = local.use_existing_ssh_keys
#   name                = each.value.admin_ssh_key_vault_name
#   resource_group_name = each.value.existing_ssh_keys_key_vault_resource_group_name
# }

# #Key Vault secret for 
# data "azurerm_key_vault_secret" "existing_ssh_keys_key_valut_secret" {
#   for_each     = local.use_existing_ssh_keys
#   name         = each.value.admin_ssh_key_vault_secret_name
#   key_vault_id = data.azurerm_key_vault.existing_ssh_keys_key_vault_id[each.key].id
# }

#NIC for windows VM
resource "azurerm_network_interface" "network_interface" {
  for_each                      = var.windows_vm_nic_variables
  name                          = each.value.name
  resource_group_name           = each.value.resource_group_name
  location                      = each.value.location #data.azurerm_resource_group.resource_group[each.key].location
  internal_dns_name_label       = each.value.internal_dns_name_label == null ? null : each.value.internal_dns_name_label
  enable_ip_forwarding          = each.value.enable_ip_forwarding == null ? false : each.value.enable_ip_forwarding
  enable_accelerated_networking = each.value.enable_accelerated_networking == null ? false : each.value.enable_accelerated_networking
  dns_servers                   = each.value.dns_servers == null ? null : each.value.dns_servers

  ip_configuration {
    name                                               = each.value.ip_configuration_name
    gateway_load_balancer_frontend_ip_configuration_id = each.value.is_gateway_load_balancer_required_to_be_attached == false ? null : data.azurerm_application_gateway.application_gateway[each.key].id
    subnet_id                                          = data.azurerm_subnet.subnet_id[each.key].id
    private_ip_address_version                         = each.value.private_ip_address_version == null ? "IPv4" : each.value.private_ip_address_version
    private_ip_address_allocation                      = each.value.private_ip_address_allocation == null ? "Dynamic" : each.value.private_ip_address_allocation
    public_ip_address_id                               = each.value.is_public_required == false ? null : data.azurerm_public_ip.public_ip[each.key].id
    primary                                            = each.value.primary == null ? false : each.value.primary
    private_ip_address                                 = each.value.private_ip_address_allocation == "Static" ? each.value.private_ip_address : null
  }

  tags = merge(each.value.nic_tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
  lifecycle { ignore_changes = [tags["Created_Time"]] }
}

#windows VM
resource "azurerm_windows_virtual_machine" "windows_virtual_machine" {
  for_each              = var.windows_virtual_machine_variables
  name                  = each.value.name
  resource_group_name   = each.value.resource_group_name
  location              = each.value.location
  size                  = each.value.size
  admin_username        = each.value.admin_username
  admin_password        = each.value.admin_password
  license_type          = each.value.license_type == null ? null : each.value.license_type
  network_interface_ids = [for nic_k, nic_v in azurerm_network_interface.network_interface : nic_v.id if(contains(each.value["vm_nic_keys"], nic_k) == true)]

  computer_name              = each.value.computer_name
  encryption_at_host_enabled = each.value.encryption_at_host_enabled
  patch_mode                 = each.value.patch_mode == null ? "AutomaticByOS" : each.value.patch_mode
  provision_vm_agent         = each.value.patch_mode == null ? true : (each.value.patch_mode == "AutomaticByPlatform" ? true : each.value.provision_vm_agent)
  secure_boot_enabled        = each.value.secure_boot_enabled == null ? null : each.value.secure_boot_enabled
  #source_image_id need to be re-written
  source_image_id            = each.value.source_image_id == null ? null : each.value.source_image_id
  custom_data                = fileexists("../script.sh") ? filebase64("../script.sh") : null
  allow_extension_operations = each.value.allow_extension_operations == null ? true : each.value.allow_extension_operations
  priority                   = each.value.priority == null ? "Regular" : each.value.priority

  os_disk {
    name                 = each.value.os_disk_name == null ? null : each.value.os_disk_name
    caching              = each.value.os_disk_caching == null ? "None" : each.value.os_disk_caching
    storage_account_type = each.value.os_disk_storage_account_type
    # dynamic "diff_disk_settings" { #Required, if diff disk settings is required
    #   for_each = each.value.diff_disk_settings_option == null ? [false] : [each.value.diff_disk_settings_option]
    #   content {
    #    option = each.value.diff_disk_settings_option
    #   }
    # }
    disk_encryption_set_id    = each.value.is_disk_encryption_set_required == false ? null : data.azurerm_disk_encryption_set.disk_encryption_set[each.key].id
    disk_size_gb              = each.value.os_disk_disk_size_gb == null ? null : each.value.os_disk_disk_size_gb
    write_accelerator_enabled = each.value.os_disk_write_accelerator_enabled == null ? false : ((each.value.os_disk_storage_account_type == "Premium_LRS" && each.value.os_disk_caching == "None") ? each.value.os_disk_write_accelerator_enabled : false)
  }

  dynamic "boot_diagnostics" { #Required, if boot diagnostics is required
    #for_each = each.value.is_boot_diagnostics_required == null ? [false] : [true]
    for_each =[
      for s in var.windows_virtual_machine_variables : s
      if s.is_boot_diagnostics_required == true
    ]
    content {
      storage_account_uri = data.azurerm_storage_account.boot_diagnostics_storage_account[each.key].primary_blob_endpoint
    }
  }

  dynamic "identity" { #Required, if boot diagnostics is required
    for_each = each.value.identity_type == null ? [false] : [true]
    content {
      type         = each.value.identity_type
      identity_ids = each.value.identity_type == "SystemAssigned" ? null : data.azurerm_user_assigned_identity.aks_user_identity[each.key].id
    }
  }

  # dynamic "plan" { #Required, if VM needs to deployed from a Marketplace image
  #   for_each = each.value.deploy_vm_from_marketplace_image == null ? [false] : [each.value.deploy_vm_from_marketplace_image]
  #   content {
  #     name      = each.value.marketplace_image_name
  #     product   = each.value.marketplace_image_product
  #     publisher = each.value.marketplace_image_publisher
  #   }
  # }

  dynamic "source_image_reference" { #Required, if source_image_reference is required
    for_each = each.value.deploy_vm_using_source_image_reference == null ? [false] : [each.value.deploy_vm_using_source_image_reference]
    content {
      publisher = each.value.source_image_reference_publisher
      offer     = each.value.source_image_reference_offer
      sku       = each.value.source_image_reference_sku
      version   = each.value.source_image_reference_version
    }
  }

  dynamic "additional_capabilities" { #Required, if Ultra SSD is required
    for_each = each.value.ultra_ssd_enabled == null ? [false] : [each.value.ultra_ssd_enabled]
    content {
      ultra_ssd_enabled = each.value.ultra_ssd_enabled
    }
  }

  tags = merge(each.value.windows_virtual_machine_tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
  lifecycle { ignore_changes = [tags["Created_Time"]] }
}
