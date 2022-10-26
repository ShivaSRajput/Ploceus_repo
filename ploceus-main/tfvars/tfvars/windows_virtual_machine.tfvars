windows_virtual_machine_variables = {
  "windows_vm_1" = {
    name                                            = "ploceuswindowsvm0001"
    resource_group_name                             = "ploceusrg000001"
    location                                        = "westus2"
    size                                            = "Standard_B2s"
    admin_username                                  = "admin01"
    admin_password                                  = "Adm1nU$er557" #admin_password should be provided if disable_password_authentication is false
    license_type                                    = null
    vm_nic_keys                                     = ["windows_vm_1_nic_1"]
    computer_name                                   = "ploceusvm0001"
    encryption_at_host_enabled                      = null
    patch_mode                                      = "AutomaticByOS"
    provision_vm_agent                              = true
    secure_boot_enabled                             = null
    allow_extension_operations                      = null
    source_image_id                                 = null
    priority                                        = null
    os_disk_name                                    = "ploceusosdisk0001a"
    os_disk_caching                                 = null
    os_disk_storage_account_type                    = "Standard_LRS"
    is_disk_encryption_set_required                 = false                             ######################
    disk_encryption_set_name                        = "ploceusdes000001a1" ######################
    os_disk_disk_size_gb                            = null
    os_disk_write_accelerator_enabled               = null
    diff_disk_settings_option                       = "Local"
    is_boot_diagnostics_required                    = true
    boot_diagnostics_storage_account_name           = "ploceussa000001a"
    identity_type                                   = "SystemAssigned"
    user_identity_name                              = null
    deploy_vm_using_source_image_reference = true
    source_image_reference_publisher       = "MicrosoftWindowsServer"
    source_image_reference_offer           = "WindowsServer"
    source_image_reference_sku             = "2016-Datacenter"
    source_image_reference_version         = "latest"
    ultra_ssd_enabled                      = false
    windows_virtual_machine_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

windows_vm_nic_variables = {
  "windows_vm_1_nic_1" = {
    name                                             = "ploceusnic0001a"
    resource_group_name                              = "ploceusrg000001"
    location                                         = "westus2"
    internal_dns_name_label                          = null
    enable_ip_forwarding                             = null
    enable_accelerated_networking                    = null
    dns_servers                                      = null
    ip_configuration_name                            = "ipconfig1"
    subnet_name                                      = "ploceussubnet000001a"
    vnet_name                                        = "ploceusvnet000001a"
    is_gateway_load_balancer_required_to_be_attached = false
    is_public_required                               = true
    public_ip_name                                   = "ploceuspublicip000001a"
    private_ip_address_version                       = "IPv4"
    private_ip_address_allocation                    = "dynamic"
    private_ip_address                               = null
    primary                                          = true
    nic_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}