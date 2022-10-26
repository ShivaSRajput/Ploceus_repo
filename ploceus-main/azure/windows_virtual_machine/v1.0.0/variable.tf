#windows VM NIC Variable
variable "windows_vm_nic_variables" {
  type = map(object({
    name                                             = string
    resource_group_name                              = string
    location                                         = string
    internal_dns_name_label                          = string
    enable_ip_forwarding                             = bool
    enable_accelerated_networking                    = bool
    dns_servers                                      = list(string)
    ip_configuration_name                            = string
    subnet_name                                      = string
    vnet_name                                        = string
    is_gateway_load_balancer_required_to_be_attached = bool
    is_public_required                               = bool
    public_ip_name                                   = string
    private_ip_address_version                       = string
    private_ip_address_allocation                    = string
    primary                                          = bool
    private_ip_address                               = string
    nic_tags                                         = map(string)
  }))
}

#windows VM Variable
variable "windows_virtual_machine_variables" {
  type = map(object({
    name                                            = string
    resource_group_name                             = string
    location                                        = string
    size                                            = string
    admin_username                                  = string
    admin_password                                  = string
#     use_ssh_keys                                    = bool
#     generate_new_ssh_key                            = bool
#     admin_ssh_key_vault_name                        = string
#     tls_private_key_algorithm                       = string
#     tls_private_key_rsa_bits                        = number
#     admin_ssh_key_vault_secret_name                 = string
#     existing_ssh_keys_key_vault_resource_group_name = string
#     ssh_keys_null_value                             = bool

    license_type                      = string
    vm_nic_keys                       = list(string)
    computer_name                     = string
    encryption_at_host_enabled        = bool
    patch_mode                        = string
    provision_vm_agent                = bool
    secure_boot_enabled               = bool
    allow_extension_operations        = bool
    source_image_id                   = string
    priority                          = string
    os_disk_name                      = string
    os_disk_caching                   = string
    os_disk_storage_account_type      = string
    is_disk_encryption_set_required   = bool
    disk_encryption_set_name          = string
    os_disk_disk_size_gb              = number
    os_disk_write_accelerator_enabled = bool
    #diff_disk_settings_option              = string
    is_boot_diagnostics_required          = bool
    boot_diagnostics_storage_account_name = string
    identity_type                         = string
    user_identity_name                    = string
    # deploy_vm_from_marketplace_image       = bool
    # marketplace_image_name                 = string
    # marketplace_image_product              = string
    # marketplace_image_publisher            = string
    deploy_vm_using_source_image_reference = bool
    source_image_reference_publisher       = string
    source_image_reference_offer           = string
    source_image_reference_sku             = string
    source_image_reference_version         = string
    ultra_ssd_enabled                      = string
    windows_virtual_machine_tags           = map(string)
  }))
}
