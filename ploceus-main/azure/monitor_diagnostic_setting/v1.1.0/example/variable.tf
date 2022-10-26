#Variable definitions
variable "diagnostic_settings" {
  type = map(object({
    diagnostics_setting_name = string
    target_resource = object({
      target_resource_name       = string
      target_resource_group_name = string
      to_append                  = string #Used for appending ths sub resource ID part (example storage ID + Blob sub part ID). For no sub resource use ""
    })
    eventhub_name = string
    eventhub_authorization_rule = object({
      eventhub_authrule_name       = string
      eventhub_namespace           = string
      eventhub_resource_group_name = string
    })
    log_analytics_workspace = object({
      log_analytics_name                = string
      log_analytics_resource_group_name = string
    })
    log_analytics_destination_type = string
    storage_account = object({
      storage_account_name                = string
      storage_account_resource_group_name = string
    })
    log = map(object({
      category = string

      retention_policy = object({
        enabled = bool
        days    = number
      })
      enabled = bool
    }))
    metric = map(object({
      category = string

      retention_policy = object({
        enabled = bool
        days    = number
      })
      enabled = bool
    }))
  }))
  default = {}
}

variable "app_storage_account_variables" {
  type = map(object({
    name                              = string
    resource_group_name               = string
    location                          = string
    account_tier                      = string
    account_replication_type          = string
    account_kind                      = string
    access_tier                       = string
    enable_https_traffic_only         = bool
    min_tls_version                   = string
    allow_nested_items_to_be_public   = bool
    large_file_share_enabled          = bool
    nfsv3_enabled                     = bool
    is_hns_enabled                    = bool
    cross_tenant_replication_enabled  = bool
    shared_access_key_enabled         = bool
    edge_zone                         = string
    infrastructure_encryption_enabled = bool
    queue_encryption_key_type         = string
    table_encryption_key_type         = string


    custom_domain = list(object({
      name          = string
      use_subdomain = bool
    }))

    identity = list(object({
      type         = string
      identity_ids = list(string)
    }))

    routing = list(object({
      publish_internet_endpoints  = bool
      publish_microsoft_endpoints = bool
      choice                      = string
    }))
    azure_files_authentication = list(object({
      directory_type = string
      active_directory = object({
        storage_sid         = string
        domain_name         = string
        domain_sid          = string
        domain_guid         = string
        forest_name         = string
        netbios_domain_name = string
      })
    }))
    
    customer_managed_key = list(object({
      key_vault_key_id          = string
      user_assigned_identity_id = string
    }))
    
    share_properties = list(object({
      retention_policy = object({
        days = number
      })
      cors_rule = list(object({
        allowed_origins    = list(string)
        allowed_methods    = list(string)
        allowed_headers    = list(string)
        exposed_headers    = list(string)
        max_age_in_seconds = number
      }))
      smb = list(object({
        versions                        = list(string)
        authentication_types            = list(string)
        kerberos_ticket_encryption_type = list(string)
        channel_encryption_type         = list(string)
      }))
    }))

    queue_properties = list(object({
      logging = object({
        delete                = bool
        read                  = bool
        version               = string
        write                 = bool
        retention_policy_days = string
      })
      hour_metrics = object({
        enabled               = bool
        include_apis          = bool
        retention_policy_days = string
        version               = string
      })
      minute_metrics = object({
        enabled               = bool
        include_apis          = bool
        retention_policy_days = string
        version               = string
      })
      cors_rule = list(object({
        allowed_origins    = list(string)
        allowed_methods    = list(string)
        allowed_headers    = list(string)
        exposed_headers    = list(string)
        max_age_in_seconds = number
      }))
    }))

    network_rules = list(object({
      default_action = string
      bypass         = list(string)
      ip_rules       = list(string)
      private_link_access = object({
        endpoint_resource_id = string
        endpoint_tenant_id   = string
      })
    }))

    storage_account_tags = map(string)
    blob_properties = list(object({
      enable_versioning        = bool
      last_access_time_enabled = bool
      change_feed_enabled      = bool
      default_service_version  = string
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
variable "log_storage_account_variables" {
  type = map(object({
    name                              = string
    resource_group_name               = string
    location                          = string
    account_tier                      = string
    account_replication_type          = string
    account_kind                      = string
    access_tier                       = string
    enable_https_traffic_only         = bool
    min_tls_version                   = string
    allow_nested_items_to_be_public   = bool
    large_file_share_enabled          = bool
    nfsv3_enabled                     = bool
    is_hns_enabled                    = bool
    cross_tenant_replication_enabled  = bool
    shared_access_key_enabled         = bool
    edge_zone                         = string
    infrastructure_encryption_enabled = bool
    queue_encryption_key_type         = string
    table_encryption_key_type         = string


    custom_domain = list(object({
      name          = string
      use_subdomain = bool
    }))

    identity = list(object({
      type         = string
      identity_ids = list(string)
    }))

    routing = list(object({
      publish_internet_endpoints  = bool
      publish_microsoft_endpoints = bool
      choice                      = string
    }))
    azure_files_authentication = list(object({
      directory_type = string
      active_directory = object({
        storage_sid         = string
        domain_name         = string
        domain_sid          = string
        domain_guid         = string
        forest_name         = string
        netbios_domain_name = string
      })
    }))
    
    customer_managed_key = list(object({
      key_vault_key_id          = string
      user_assigned_identity_id = string
    }))
    
    share_properties = list(object({
      retention_policy = object({
        days = number
      })
      cors_rule = list(object({
        allowed_origins    = list(string)
        allowed_methods    = list(string)
        allowed_headers    = list(string)
        exposed_headers    = list(string)
        max_age_in_seconds = number
      }))
      smb = list(object({
        versions                        = list(string)
        authentication_types            = list(string)
        kerberos_ticket_encryption_type = list(string)
        channel_encryption_type         = list(string)
      }))
    }))

    queue_properties = list(object({
      logging = object({
        delete                = bool
        read                  = bool
        version               = string
        write                 = bool
        retention_policy_days = string
      })
      hour_metrics = object({
        enabled               = bool
        include_apis          = bool
        retention_policy_days = string
        version               = string
      })
      minute_metrics = object({
        enabled               = bool
        include_apis          = bool
        retention_policy_days = string
        version               = string
      })
      cors_rule = list(object({
        allowed_origins    = list(string)
        allowed_methods    = list(string)
        allowed_headers    = list(string)
        exposed_headers    = list(string)
        max_age_in_seconds = number
      }))
    }))

    network_rules = list(object({
      default_action = string
      bypass         = list(string)
      ip_rules       = list(string)
      private_link_access = object({
        endpoint_resource_id = string
        endpoint_tenant_id   = string
      })
    }))

    storage_account_tags = map(string)
    blob_properties = list(object({
      enable_versioning        = bool
      last_access_time_enabled = bool
      change_feed_enabled      = bool
      default_service_version  = string
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



variable "log_resource_group_variables" {
  description = "Map of Resource groups"
  type = map(object({
    name                = string
    location            = string
    resource_group_tags = map(string)
  }))
  default = {}
}

variable "app_resource_group_variables" {
  description = "Map of Resource groups"
  type = map(object({
    name                = string
    location            = string
    resource_group_tags = map(string)
  }))
  default = {}
}
