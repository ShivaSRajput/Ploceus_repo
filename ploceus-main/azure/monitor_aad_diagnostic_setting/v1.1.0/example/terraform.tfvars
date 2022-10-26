
#variables for diagnostic settings
diagnostic_settings = {
  "settings1" = {
    diagnostic_setting_name = "settings1"
    eventhub_authorization_rule = {
      eventhub_namespace           = null
      eventhub_authrule_name       = null
      eventhub_resource_group_name = null
    }
    eventhub_name = null
    log = {
      category = "SignInLogs"
    enabled  = true
    retention_policy ={
      enabled = true
      days    = 1
    }
    }
    log_analytics_workspace = {
      log_analytics_name                = null
      log_analytics_resource_group_name = null
    }
    storage_account = {
      storage_account_name                = "ploceusstg000001"
      storage_account_resource_group_name = "ploceusrg000001"
    }
  }
}

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

storage_account_variables = {
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
      Created_By = "Ploceus"
      Department = "CIS"
    }
    table_encryption_key_type = null
  }
}

log_analytics_workspace_sub_subscription_id = "7877d8aa-c51f-4741-b864-e77ef88cd435"
log_analytics_workspace_sub_tenant_id       = "687f51c3-0c5d-4905-84f8-97c683a5b9d1"
storage_resource_sub_subscription_id        = "7877d8aa-c51f-4741-b864-e77ef88cd435"
storage_resource_sub_tenant_id              = "687f51c3-0c5d-4905-84f8-97c683a5b9d1"
eventhub_sub_tenant_id                      = "687f51c3-0c5d-4905-84f8-97c683a5b9d1"
eventhub_sub_subscription_id                = "7877d8aa-c51f-4741-b864-e77ef88cd435"