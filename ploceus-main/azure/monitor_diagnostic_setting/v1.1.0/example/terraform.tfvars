
#variables for diagnostics settings
diagnostic_settings = {
  "diagnostics" = {
    diagnostics_setting_name = "diagnostics"
    eventhub_authorization_rule = {
      eventhub_namespace           = null
      eventhub_authrule_name       = null
      eventhub_resource_group_name = null
    }
    eventhub_name = null
    log = {
       "key" = {
        category = "StorageDelete"
        enabled  = true
        retention_policy = {
          days    = 0
          enabled = false
        }
      }
    }
    log_analytics_destination_type = null
    log_analytics_workspace = {
      log_analytics_name                = null
      log_analytics_resource_group_name = null
    }
    metric = {
      "key" = {
        category = "Transaction"
        enabled  = true
        retention_policy = {
          days    = 0
          enabled = false
        }
      }
    }
    storage_account = {
      storage_account_name                = "ploceusstg000002"
      storage_account_resource_group_name = "ploceusrg000002"
    }
    target_resource = {
      target_resource_name       = "ploceusstg000001"
      target_resource_group_name = "ploceusrg000001"
      to_append                  = "/blobServices/Default"  #Used for appending ths sub resource ID part (example storage ID + Blob sub part ID). For no sub resource use ""
    }
  }
}
app_resource_group_variables = {
  "app_resource_group" = {
    name     = "ploceusrg000001"
    location = "westus2"
    resource_group_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}
log_resource_group_variables = {
 "log_resource_group" = {
    name     = "ploceusrg000002"
    location = "westus2"
    resource_group_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

app_storage_account_variables = {
  "ploceus_app_storage" = {
    access_tier = null
    account_kind = null
    account_replication_type = "LRS"
    account_tier = "Standard"
    allow_nested_items_to_be_public = null
    azure_files_authentication = []
    blob_properties = [  ]
    cross_tenant_replication_enabled = null
    custom_domain = []
    customer_managed_key = [ ]
    edge_zone = null
    enable_https_traffic_only = null
    identity = [ ]
    infrastructure_encryption_enabled = null
    is_hns_enabled =null
    large_file_share_enabled = null
    location = "westus2"
    min_tls_version = null
    name = "ploceusstg000001"
    network_rules = [  ]
    nfsv3_enabled = null
    queue_encryption_key_type = null
    queue_properties = []
    resource_group_name = "ploceusrg000001"
    routing = [ ]
    share_properties = []
    shared_access_key_enabled = null
    static_website = {
      custom_404_path = null
      index_path = null
    }
    storage_account_tags = {
      "Created_By" = "Ploceus"
      Department = "CIS"
    }
    table_encryption_key_type = null
  }
}
log_storage_account_variables = {
  "ploceus_log_storage" = {
    access_tier = null
    account_kind = null
    account_replication_type = "LRS"
    account_tier = "Standard"
    allow_nested_items_to_be_public = null
    azure_files_authentication = []
    blob_properties = [  ]
    cross_tenant_replication_enabled = null
    custom_domain = []
    customer_managed_key = [ ]
    edge_zone = null
    enable_https_traffic_only = null
    identity = [ ]
    infrastructure_encryption_enabled = null
    is_hns_enabled =null
    large_file_share_enabled = null
    location = "westus2"
    min_tls_version = null
    name = "ploceusstg000002"
    network_rules = [  ]
    nfsv3_enabled = null
    queue_encryption_key_type = null
    queue_properties = []
    resource_group_name = "ploceusrg000002"
    routing = [ ]
    share_properties = []
    shared_access_key_enabled = null
    static_website = {
      custom_404_path = null
      index_path = null
    }
    storage_account_tags = {
      Created_By = "Ploceus"
      Department = "CIS"
    }
    table_encryption_key_type = null
  }
}
monitor_diagnostic_sub_subscription_id      = "7877d8aa-c51f-4741-b864-e77ef88cd435"
monitor_diagnostic_sub_tenant_id            = "687f51c3-0c5d-4905-84f8-97c683a5b9d1"
log_analytics_workspace_sub_subscription_id = "7877d8aa-c51f-4741-b864-e77ef88cd435"
log_analytics_workspace_sub_tenant_id       = "687f51c3-0c5d-4905-84f8-97c683a5b9d1"
storage_resource_sub_subscription_id        = "7877d8aa-c51f-4741-b864-e77ef88cd435"
storage_resource_sub_tenant_id              = "687f51c3-0c5d-4905-84f8-97c683a5b9d1"
eventhub_sub_tenant_id                      = "687f51c3-0c5d-4905-84f8-97c683a5b9d1"
eventhub_sub_subscription_id                = "7877d8aa-c51f-4741-b864-e77ef88cd435"
