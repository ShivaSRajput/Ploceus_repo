storage_account_variables = {
    "storage_account_1" = {
      name                              = "ploceussa000001"
      resource_group_name               = "ploceusrg000001"
      location                          = "westus2"
      account_tier                      = "Standard"
      account_replication_type          = "LRS"
      account_kind                      = "StorageV2"
      access_tier                       = "Hot"
      enable_https_traffic_only         = true
      min_tls_version                   = "TLS1_2"
      allow_nested_items_to_be_public   = true
      large_file_share_enabled          = false
      is_hns_enabled                    = false #This can only be true when account_tier is Standard or Premium and account_kind is BlockBlobStorage
      nfsv3_enabled                     = false #This can only be true when account_tier is Standard and account_kind is StorageV2, or account_tier is Premium and account_kind is BlockBlobStorage. Additionally, the is_hns_enabled is true, and enable_https_traffic_only is false.
      cross_tenant_replication_enabled  = true
      shared_access_key_enabled         = true
      queue_encryption_key_type         = "service" #is only allowed when the account_kind is set to StorageV2.
      table_encryption_key_type         = "service" #is only allowed when the account_kind is set to StorageV2.
      edge_zone                         = null
      infrastructure_encryption_enabled = true #This can only be true when account_kind is StorageV2 or when account_tier is Premium and account_kind is BlockBlobStorage.
      custom_domain                     = null
      routing                           = null
      azure_files_authentication        = null
      identity                          = null
      customer_managed_key              = null
      custom_domain                     = null
      network_rules                     = null
      share_properties                  = null
      queue_properties                  = null
      blob_properties                   = null
      static_website                    = null
      storage_account_tags = {
        Created_By = "Ploceus",
        Department = "CIS"
      }
    }
  }

#STORAGE CONTAINER
storage_container_variables = {
 "storage_container" = {
  name                  = "ploceussc000001a"
  storage_account_name  = "ploceussa000001"
  container_access_type = "container"
  metadata              = null
  }
}

subscription_cost_management_export_variables = {
  "subscription_cost_management_export_variables_1" = {
    cost_management_export_name                   = "ploceussubcostmgmt000001"
    subscription_id                               = "xxxxxxxxxxxx"
    storage_account_name                          = "ploceussa000001"
    storage_container_name                        = "ploceussc000001a"
    recurrence_type                               = "Monthly"
    recurrence_period_start_date                  = "2022-10-14T00:00:00Z"
    recurrence_period_end_date                    = "2022-10-14T00:00:00Z"
    export_data_storage_location_root_folder_path = "/root/updated"
    export_data_options_type                      = "Usage"
    export_data_options_time_frame                = "WeekToDate"
    active                                        = true
  }
}
