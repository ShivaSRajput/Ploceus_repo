monitor_log_profiles = {
  "monitorlog1" = {
    categories = [
      "Action",
      "Delete",
      "Write",
    ]
    locations = [
      "westus",
      "global",
    ]
    monitor_log_name = "ploceusmonitorlog000001"
    retention_policy = {
      days    = 1
      enabled = false
    }
    servicebus_rule = {
      servicebus_type                = null #can only contains eventhub, servicebus, null
      servicebus_name                = null
      servicebus_namespace           = null
      servicebus_resource_group_name = null
    }
    storage_account = {
      storage_account_name                = "ploceusstg000001"
      storage_account_resource_group_name = "ploceusrg000001"
    }
  }
}


resource_group_variables = {
  resource_group = {
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
    access_tier                       = null
    account_kind                      = null
    account_replication_type          = "LRS"
    account_tier                      = "Standard"
    allow_nested_items_to_be_public   = null
    azure_files_authentication        = []
    blob_properties                   = []
    cross_tenant_replication_enabled  = null
    custom_domain                     = []
    customer_managed_key              = []
    edge_zone                         = null
    enable_https_traffic_only         = null
    identity                          = []
    infrastructure_encryption_enabled = null
    is_hns_enabled                    = null
    large_file_share_enabled          = null
    location                          = "westus2"
    min_tls_version                   = null
    name                              = "ploceusstg000001"
    network_rules                     = []
    nfsv3_enabled                     = null
    queue_encryption_key_type         = null
    queue_properties                  = []
    resource_group_name               = "ploceusrg000001"
    routing                           = []
    share_properties                  = []
    shared_access_key_enabled         = null
    static_website = {
      custom_404_path = null
      index_path      = null
    }
    storage_account_tags = {
      Created_By = "Ploceus"
      Department = "CIS"
    }
    table_encryption_key_type = null
  }
}


main_sub_subscription_id       = "7877d8aa-c51f-4741-b864-e77ef88cd435"
main_sub_tenant_id             = "687f51c3-0c5d-4905-84f8-97c683a5b9d1"
storage_sub_subscription_id    = "7877d8aa-c51f-4741-b864-e77ef88cd435"
storage_sub_tenant_id          = "687f51c3-0c5d-4905-84f8-97c683a5b9d1"
servicebus_sub_subscription_id = "7877d8aa-c51f-4741-b864-e77ef88cd435"
servicebus_sub_tenant_id       = "687f51c3-0c5d-4905-84f8-97c683a5b9d1"