#RESOURCE GROUP 
resource_group_variables = {
  "resource_group_1" = {
    name     = "ploceusrg000001"
    location = "westus2"
    resource_group_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

#VNET
vnets_variables = {
  "vnet_1" = {
    name                        = "ploceusvnet000001a"
    location                    = "westus2"
    resource_group_name         = "ploceusrg000001"
    address_space               = ["10.0.0.0/16"]
    dns_servers                 = []
    is_ddos_protection_required = false #Provide the value as true only if ddos_protection_plan is required
    ddos_protection_plan_name   = null  #Provide the name of the ddos protection plan if above value is true or else keep it as null. If new DDOS protection plan needs to be created uncomment from line 24 to 34
    vnet_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

#DDOS plan creation is optional and costly. Uncommenting the below module (line 24 to 34) will create a new DDOS protection plan. Use only if required. 
#If DDOS protection plan is required for vnet also uncomment lines 40 to 47 from variable.tf inside example folder and
#Also uncomment lines 9 to 12 from main.tf inside example folder

#DDOS protection plan (Optional module for VNET)
# ddos_protection_plan_variables = {
#   "ddos_plan_1" = {
#     name                            = "ploceusddosplan000001"
#     location                        = "westus2"
#     resource_group_name             = "ploceusrg000001"
#     ddos_protection_plan_tags = {
#       Created_By = "Ploceus",
#       Department = "CIS"
#     }
#   }
# }

#SUBNET
subnet_variables = {
  "subnet_1" = {
    name                                           = "ploceussubnet000001a"
    resource_group_name                            = "ploceusrg000001"
    address_prefixes                               = ["10.0.1.0/24"]
    virtual_network_name                           = "ploceusvnet000001a"
    enforce_private_link_service_network_policies  = true
    enforce_private_link_endpoint_network_policies = true
    is_delegetion_required                         = false #update to true if delegation required and update delegation name,service_name,Service_actions
    service_endpoints                              = null
    delegation_name                                = null
    service_name                                   = null
    service_actions                                = null
  }
}

#PUBLIC IP
public_ip_variable = {
  "public_ip_1" = {
    name                    = "ploceuspublicip000001a"
    resource_group_name     = "ploceusrg000001"
    location                = "westus2"
    ip_version              = "IPv4"
    allocation_method       = "Static"
    sku                     = "Standard"
    sku_tier                = "Regional"
    public_ip_dns           = "ploceuspublicip000001a"
    idle_timeout_in_minutes = "30"
    availability_zone       = "1"
    reverse_fqdn            = null
    ip_tags                 = null
    public_ip_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

#APPLICATION GATEWAY 
application_gateway_variables = {
  "application_gateway_1" = {
    name                           = "ploceusapgw000001a"
    resource_group_name            = "ploceusrg000001"
    location                       = "westus2"
    sku_name                       = "Standard_v2"
    sku_tier                       = "Standard_v2"
    sku_capacity                   = 1
    gateway_ip_configuration_name  = "apgw000001a-gicconfig"
    vnet_name                      = "ploceusvnet000001a"
    subnet_name                    = "ploceussubnet000001a"
    frontend_port_name             = "apgw000001a-feip"
    frontend_port                  = 80
    frontend_ip_configuration_name = "apgw000001a-feipconfig"
    is_private_fronted_ip_required = false
    private_ip_address             = null
    is_public_fronted_ip_required  = true
    public_ip_name                 = "ploceuspublicip000001a"
    private_ip_address_allocation  = null

    sku = {
      name     = "Standard_v2"
      tier     = "Standard_v2"
      capacity = null
    }

    waf_configuration = {
      firewall_mode    = "Prevention"
      rule_set_type    = "OWASP"
      rule_set_version = "3.1"
      enabled          = true
    }
    frontend_ports = [
      {
        name = "appgateway-feporthttp"
        port = 80
      },
      {
        name = "appgateway-feport8080"
        port = 8080
      }
    ]

    backend_address_pools = [
      {
        name         = "appgateway-beap"
        fqdns        = null
        ip_addresses = null
      }
    ]

    autoscale_configuration = {
      min_capacity = 5
      max_capacity = 10
    }
    backend_http_settings = [
      {
        name                                = "http-be-htst"
        path                                = "/"
        port                                = 8443
        protocol                            = "Http"
        cookie_based_affinity               = "Enabled"
        request_timeout                     = 20
        probe_name                          = "http-bc-prob"
        host_name                           = "hostname.com"
        pick_host_name_from_backend_address = false
      }
    ]
    http_listeners = [
      {
        name                           = "http-bc-lstn"
        frontend_ip_configuration_name = "apgw000001a-feipconfig"
        frontend_port_name             = "appgateway-feporthttp"
        protocol                       = "Http"
        ssl_certificate_name           = null
        sni_required                   = false
        listener_type                  = "MultiSite"
        host_name                      = "hostname.com"
        host_names                     = null
        firewall_policy_id             = null
      },
      {
        name                           = "http-bc-lstn2"
        frontend_ip_configuration_name = "apgw000001a-feipconfig"
        frontend_port_name             = "appgateway-feport8080"
        protocol                       = "Http"
        ssl_certificate_name           = null
        sni_required                   = false
        listener_type                  = "MultiSite"
        host_name                      = "hostname2.com"
        host_names                     = null
        firewall_policy_id             = null
      }
    ]
    request_routing_rules = [
      {
        name                        = "http-bc-rqrt"
        rule_type                   = "PathBasedRouting"
        listener_name               = "http-bc-lstn"
        backend_address_pool_name   = null
        backend_http_settings_name  = null
        rewrite_rule_set_name       = null
        redirect_configuration_name = null
        url_path_map_name           = "urlpathbasedmaps"
      }
    ]
    url_path_maps = [{
      name                                = "urlpathbasedmaps"
      default_backend_http_settings_name  = null
      default_backend_address_pool_name   = null
      default_redirect_configuration_name = "bc-rconfig"
      default_rewrite_rule_set_name       = null
      path_rules = [{
        name                        = "mytheartrule"
        paths                       = ["/*"]
        backend_http_settings_name  = null
        backend_address_pool_name   = null
        redirect_configuration_name = "bc-rconfig"
        rewrite_rule_set_name       = null
      }]
    }]
    probes = [
      {
        name                                      = "http-bc-prob"
        path                                      = "/"
        protocol                                  = "Http"
        host                                      = "hostname.com"
        interval                                  = null
        timeout                                   = null
        unhealthy_threshold                       = null
        pick_host_name_from_backend_http_settings = false
      }
    ]
    redirect_configurations = [
      {
        name                 = "bc-rconfig"
        redirect_type        = "Permanent"
        target_listener_name = "http-bc-lstn2"
        target_url           = null
        include_path         = true
        include_query_string = true
      }
    ]
    waf_configuration                       = null
    disabled_ssl_protocols                  = null
    trusted_root_certificate_names          = null
    ssl_certificate_names                   = null
    key_vault_with_private_endpoint_enabled = true

    application_gateway_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}


#KEY VAULT
key_vault_variables = {
  "key_vault_for_disk_encryption_set" = {
    name                                    = "ploceuskeyvault000001a1"
    location                                = "westus2"
    resource_group_name                     = "ploceusrg000001"
    enabled_for_disk_encryption             = true
    enabled_for_deployment                  = true
    enabled_for_template_deployment         = true
    enable_rbac_authorization               = false
    soft_delete_retention_days              = "7"
    purge_protection_enabled                = true
    sku_name                                = "standard"
    access_policy_key_permissions           = ["Get", "List", "Create", "Delete", "Recover", "Backup", "Restore", "Purge"]
    access_policy_secret_permissions        = ["Get", "List", "Delete", "Recover", "Backup", "Restore", "Purge"]
    access_policy_storage_permissions       = []
    access_policy_certificate_permissions   = []
    network_acls_enabled                    = false
    network_acls_bypass                     = "AzureServices"
    network_acls_default_action             = "Allow"
    network_acls_ip_rules                   = null
    network_acls_virtual_network_subnet_ids = null
    contact_information_enabled             = false
    contact_email                           = "xxxxxxxxxxx@gmail.com"
    contact_name                            = "xxxxxxxxxxx"
    contact_phone                           = "99999999999"
    key_vault_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  },
  "key_vault_for_saving_private_key" = {
    name                                    = "ploceuskeyvault000001a2"
    location                                = "westus2"
    resource_group_name                     = "ploceusrg000001"
    enabled_for_disk_encryption             = false
    enabled_for_deployment                  = true
    enabled_for_template_deployment         = true
    enable_rbac_authorization               = false
    soft_delete_retention_days              = "7"
    purge_protection_enabled                = false
    sku_name                                = "standard"
    access_policy_key_permissions           = ["Get", "List", "Create", "Delete", "Recover", "Backup", "Restore", "Purge"]
    access_policy_secret_permissions        = ["Get", "List", "Delete", "Recover", "Backup", "Restore", "Purge"]
    access_policy_storage_permissions       = []
    access_policy_certificate_permissions   = []
    network_acls_enabled                    = false
    network_acls_bypass                     = "AzureServices"
    network_acls_default_action             = "Allow"
    network_acls_ip_rules                   = null
    network_acls_virtual_network_subnet_ids = null
    contact_information_enabled             = false
    contact_email                           = "xxxxxxxxxx@gmail.com"
    contact_name                            = "xxxxxxxxxx"
    contact_phone                           = "99999999999"
    key_vault_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

#KEY VAULT KEY
key_vault_key_variables = {
  "key_vault_key_1" = {
    name                = "ploceuskey000001a1"
    resource_group_name = "ploceusrg000001"
    key_vault_name      = "ploceuskeyvault000001a1"
    key_type            = "RSA"
    key_size            = 2048
    curve               = null
    key_opts            = ["decrypt", "encrypt", "sign", "unwrapKey", "verify", "wrapKey"]
    not_before_date     = null
    expiration_date     = null
    key_vault_key_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

#DISK ENCRYPTION SET
disk_encryption_set_variables = {
  "disk_encryption_set_1" = {
    name                      = "ploceuploceusdiskencryptionset000001a1"
    resource_group_name       = "ploceusrg000001"
    location                  = "westus2"
    key_vault_name            = "ploceuskeyvault000001a1"
    key_vault_key_name        = "ploceuskey000001a1"
    auto_key_rotation_enabled = null
    encryption_type           = null
    identity_type             = null #Currently only "SystemAssigned" is supported
    disk_encryption_set_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

#KEY VAULT ACCESS POLICY
key_vault_access_policy_variables = {
  "key_vault_access_policy_1" = {
    key_permissions         = ["Get", "WrapKey", "UnwrapKey"]
    secret_permissions      = []
    storage_permissions     = []
    key_vault_name          = "ploceuskeyvault000001a1"
    resource_group_name     = "ploceusrg000001"
    disk_encryption_set_key = "disk_encryption_set_1"
  }
}

#STORAGE ACCOUNT
storage_account_variables = {
  "storage_account_boot_diagnostics" = {
    name                      = "ploceusbootdiag000001a"
    resource_group_name       = "ploceusrg000001"
    location                  = "westus2"
    account_tier              = "Standard"
    account_replication_type  = "LRS"
    account_kind              = "StorageV2"
    access_tier               = "Hot"
    enable_https_traffic_only = true
    min_tls_version           = "TLS1_2"
    allow_blob_public_access  = true
    large_file_share_enabled  = false
    nfsv3_enabled             = false
    is_hns_enabled            = false #This can only be true when account_tier is Standard or Premium and account_kind is BlockBlobStorage
    blob_properties           = []
    static_website            = null
    storage_account_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}


#NIC
linux_vm_nic_variables = {
  "linux_vm_1_nic_1" = {
    name                                             = "ploceusnic000001a"
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

#NSG
network_security_group_variable = {
  "network_security_group_1" = {
    name                = "ploceusnsg000001a"
    resource_group_name = "ploceusrg000001"
    security_rule       = null
    network_security_group_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

#NSG Association
nsg_association_variable = {
  "nsg_association_variable_1" = {
    nic_association = [
      {
        nic_name            = "ploceusnic000001a"
        nsg_to_associate    = "ploceusnsg000001a"
        resource_group_name = "ploceusrg000001"
      }
    ]
    subnet_association = null
  }
}

#LINUX VM
linux_virtual_machine_variables = {
  "linux_vm_1" = {
    name                                            = "ploceuslinux000001a"
    resource_group_name                             = "ploceusrg000001"
    location                                        = "westus2"
    size                                            = "Standard_B2s"
    admin_username                                  = "Ploceus"
    admin_password                                  = "Adm1nU$er557" #admin_password should be provided if disable_password_authentication is false
    disable_password_authentication                 = false
    use_ssh_keys                                    = true
    generate_new_ssh_key                            = true
    ssh_keys_null_value                             = true
    admin_ssh_key_vault_name                        = "ploceuskeyvault000001a2" #"existingkeyvaultscenario" #"ploceuskeyvault000001b"
    tls_private_key_algorithm                       = "RSA"
    tls_private_key_rsa_bits                        = 2048
    existing_ssh_keys_key_vault_resource_group_name = "PloceusSSHkeysRG"
    admin_ssh_key_vault_secret_name                 = "adminsshprivatelinuxvm1"
    license_type                                    = null
    vm_nic_keys                                     = ["linux_vm_1_nic_1"]
    computer_name                                   = "ploceuslinux000001a"
    encryption_at_host_enabled                      = null
    patch_mode                                      = "ImageDefault"
    provision_vm_agent                              = true
    secure_boot_enabled                             = null
    allow_extension_operations                      = null
    source_image_id                                 = null
    priority                                        = null
    os_disk_name                                    = "ploceusosdisk000001a"
    os_disk_caching                                 = null
    os_disk_storage_account_type                    = "Standard_LRS"
    is_disk_encryption_set_required                 = false                             ######################
    disk_encryption_set_name                        = "ploceusdiskencryptionset000001a" ######################
    os_disk_disk_size_gb                            = 70
    os_disk_write_accelerator_enabled               = null
    diff_disk_settings_option                       = "Local"
    is_boot_diagnostics_required                    = true
    boot_diagnostics_storage_account_name           = "ploceusbootdiag000001a"
    identity_type                                   = "SystemAssigned"
    user_identity_name                              = null
    # deploy_vm_from_marketplace_image       = null
    # marketplace_image_name                 = null
    # marketplace_image_product              = null
    # marketplace_image_publisher            = null
    deploy_vm_using_source_image_reference = true
    source_image_reference_publisher       = "Canonical"
    source_image_reference_offer           = "UbuntuServer"
    source_image_reference_sku             = "18.04-LTS"
    source_image_reference_version         = "latest"
    ultra_ssd_enabled                      = false
    linux_virtual_machine_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}
