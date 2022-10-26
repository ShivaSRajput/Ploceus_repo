#RESOURCE GROUP VARIABLES
variable "resource_group_variables" {
  description = "Map of Resource groups"
  type = map(object({
    name                = string
    location            = string
    resource_group_tags = map(string)
  }))
  default = {}
}

#VNET variable
variable "vnets_variables" {
  description = "Map of vnet objects. name, vnet_address_space, and dns_server supported"
  type = map(object({
    name                        = string
    location                    = string
    resource_group_name         = string
    address_space               = list(string)
    dns_servers                 = list(string)
    is_ddos_protection_required = bool
    ddos_protection_plan_name   = string
    vnet_tags                   = map(string)
  }))
  default = {}
}

#DDOS protection plan variable #Uncomment the below lines if DDOS protection is required 
#variable "ddos_protection_plan_variables" {
# type = map(object({
# name                            = string
#resource_group_name             = string
#location                        = string
#ddos_protection_plan_tags       = map(string)
#}))
#}

#SUBNET Variables
variable "subnet_variables" {
  type = map(object({
    name                                           = string
    resource_group_name                            = string
    virtual_network_name                           = string
    address_prefixes                               = list(string)
    enforce_private_link_service_network_policies  = bool
    enforce_private_link_endpoint_network_policies = bool
    service_endpoints                              = list(string)
    is_delegetion_required                         = bool
    delegation_name                                = string
    service_name                                   = string
    service_actions                                = list(string)
  }))
  default = {}
}

#PUBLIC IP Variables
variable "public_ip_variable" {
  type = map(object({
    name                    = string
    resource_group_name     = string
    location                = string
    ip_version              = string
    allocation_method       = string
    sku                     = string
    sku_tier                = string
    public_ip_dns           = string
    idle_timeout_in_minutes = string
    availability_zone       = string
    reverse_fqdn            = string
    ip_tags                 = map(string)
    public_ip_tags          = map(string)
  }))
}


#APPLICATION GATEWAY Variables
variable "application_gateway_variables" {
  type = map(object({
    name                           = string
    resource_group_name            = string
    location                       = string
    sku_name                       = string
    sku_tier                       = string
    sku_capacity                   = number
    gateway_ip_configuration_name  = string
    vnet_name                      = string
    subnet_name                    = string
    frontend_port_name             = string
    frontend_port                  = number
    frontend_ip_configuration_name = string
    is_private_fronted_ip_required = bool
    private_ip_address             = string
    is_public_fronted_ip_required  = bool
    public_ip_name                 = string
    private_ip_address_allocation  = string
    application_gateway_tags       = map(string)


    sku = object({
      name     = string
      tier     = string
      capacity = number
    })

    autoscale_configuration = object({
      min_capacity = number
      max_capacity = number
    })

    frontend_ports = list(object({
      name = string
      port = number
    }))

    backend_address_pools = list(object({
      name         = string
      fqdns        = list(string)
      ip_addresses = list(string)
    }))

    backend_http_settings = list(object({
      name                                = string
      cookie_based_affinity               = string
      path                                = string
      port                                = number
      request_timeout                     = number
      probe_name                          = string
      protocol                            = string
      host_name                           = string
      pick_host_name_from_backend_address = bool
    }))

    http_listeners = list(object({
      name                           = string
      frontend_ip_configuration_name = string
      frontend_port_name             = string
      ssl_certificate_name           = string
      protocol                       = string
      sni_required                   = bool
      listener_type                  = string       # MultiSite or Basic
      host_name                      = string       # Required if listener_type = MultiSite and host_names = null
      host_names                     = list(string) # Required if listener_type = MultiSite and host_name = null
      firewall_policy_id             = string
    }))

    request_routing_rules = list(object({
      name                        = string
      rule_type                   = string
      listener_name               = string
      backend_address_pool_name   = string
      backend_http_settings_name  = string
      redirect_configuration_name = string
      url_path_map_name           = string
      rewrite_rule_set_name       = string
    }))

    url_path_maps = list(object({
      name                                = string
      default_backend_http_settings_name  = string
      default_backend_address_pool_name   = string
      default_redirect_configuration_name = string
      default_rewrite_rule_set_name       = string
      path_rules = list(object({
        name                        = string
        paths                       = list(string)
        backend_http_settings_name  = string
        backend_address_pool_name   = string
        redirect_configuration_name = string
        rewrite_rule_set_name       = string
      }))
    }))
    waf_configuration = object({
      firewall_mode    = string
      rule_set_type    = string
      rule_set_version = number
      enabled          = bool
    })

    probes = list(object({
      name                                      = string
      path                                      = string
      interval                                  = number
      protocol                                  = string
      timeout                                   = number
      unhealthy_threshold                       = number
      host                                      = string
      pick_host_name_from_backend_http_settings = bool
    }))
    redirect_configurations = list(object({
      name                 = string
      redirect_type        = string
      target_listener_name = string
      target_url           = string
      include_path         = bool
      include_query_string = bool
    }))

  }))
}

#KEY VAULT
variable "key_vault_variables" {
  type = map(object({
    name                                    = string
    resource_group_name                     = string
    location                                = string
    enabled_for_disk_encryption             = bool
    enabled_for_deployment                  = bool
    enabled_for_template_deployment         = bool
    enable_rbac_authorization               = bool
    soft_delete_retention_days              = string
    purge_protection_enabled                = bool
    sku_name                                = string
    access_policy_key_permissions           = list(string)
    access_policy_secret_permissions        = list(string)
    access_policy_storage_permissions       = list(string)
    access_policy_certificate_permissions   = list(string)
    key_vault_tags                          = map(string)
    network_acls_enabled                    = bool
    network_acls_bypass                     = string
    network_acls_default_action             = string
    network_acls_ip_rules                   = list(string)
    network_acls_virtual_network_subnet_ids = list(string)
    contact_information_enabled             = bool
    contact_email                           = string
    contact_name                            = string
    contact_phone                           = string
  }))
}

#KEY VAULT KEY variables
variable "key_vault_key_variables" {
  type = map(object({
    name                = string
    resource_group_name = string
    key_vault_name      = string
    key_size            = number
    key_type            = string
    curve               = string
    key_opts            = list(string)
    not_before_date     = string
    expiration_date     = string
    key_vault_key_tags  = map(string)
  }))
}

#DISK ENCRYPTION SET variables
variable "disk_encryption_set_variables" {
  type = map(object({
    name                      = string
    resource_group_name       = string
    location                  = string
    auto_key_rotation_enabled = bool
    encryption_type           = string
    identity_type             = string
    key_vault_name            = string
    key_vault_key_name        = string
    disk_encryption_set_tags  = map(string)
  }))
}

#KEY VAULT ACCESS POLICY variables
variable "key_vault_access_policy_variables" {
  type = map(object({
    key_permissions         = list(string)
    secret_permissions      = list(string)
    storage_permissions     = list(string)
    key_vault_name          = string
    resource_group_name     = string
    disk_encryption_set_key = string
  }))
}



#STORAGE ACCOUNT Variables
variable "storage_account_variables" {
  type = map(object({
    name                      = string
    resource_group_name       = string
    location                  = string
    account_tier              = string
    account_replication_type  = string
    account_kind              = string
    access_tier               = string
    enable_https_traffic_only = bool
    min_tls_version           = string
    allow_blob_public_access  = bool
    large_file_share_enabled  = bool
    nfsv3_enabled             = bool
    is_hns_enabled            = bool
    storage_account_tags      = map(string)
    blob_properties = list(object({
      enable_versioning        = bool
      last_access_time_enabled = bool
      change_feed_enabled      = bool
      delete_retention_policy = object({
        blob_retention_policy = string
      })
      container_delete_retention_policy = object({
        container_delete_retention_policy = string
      })
      cors_rule = list(object({
        allowed_origins    = list(string)
        allowed_methods    = list(string)
        allowed_headers    = list(string)
        exposed_headers    = list(string)
        max_age_in_seconds = number
      }))
    }))
    static_website = object({
      index_path      = string
      custom_404_path = string
    })
  }))
}

#windows VM NIC Variables
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

#NETWORK SECURITY GROUP Variables
variable "network_security_group_variable" {
  type = map(object({
    name                = string
    resource_group_name = string
    security_rule = list(object({
      name                                       = string
      description                                = string
      protocol                                   = string
      source_port_range                          = string
      source_port_ranges                         = list(string)
      destination_port_range                     = string
      destination_port_ranges                    = list(string)
      source_address_prefix                      = string
      source_address_prefixes                    = list(string)
      source_application_security_group_ids      = list(string)
      destination_address_prefix                 = string
      destination_address_prefixes               = list(string)
      destination_application_security_group_ids = list(string)
      access                                     = string
      priority                                   = string
      direction                                  = string
    }))
    network_security_group_tags = map(string)
  }))
}


#NETWORK SECURITY GROUP ASSOCIATION Variables
variable "nsg_association_variable" {
  type = map(object({
    nic_association = list(object({
      nic_name            = string
      nsg_to_associate    = string
      resource_group_name = string
    }))
    subnet_association = list(object({
      vnet_name           = string
      snet_name           = string
      nsg_to_associate    = string
      resource_group_name = string
    }))
  }))
}

#windows VM Variables
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
    license_type                                    = string
    vm_nic_keys                                     = list(string)
    computer_name                                   = string
    encryption_at_host_enabled                      = bool
    patch_mode                                      = string
    provision_vm_agent                              = bool
    secure_boot_enabled                             = bool
    allow_extension_operations                      = bool
    source_image_id                                 = string
    priority                                        = string
    os_disk_name                                    = string
    os_disk_caching                                 = string
    os_disk_storage_account_type                    = string
    is_disk_encryption_set_required                 = bool
    disk_encryption_set_name                        = string
    os_disk_disk_size_gb                            = number
    os_disk_write_accelerator_enabled               = bool
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
