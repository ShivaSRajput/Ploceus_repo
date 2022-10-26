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

application_insights_variables = {
  application_insights_1 = {
    application_insights_name               = "applicationinsights000001"
    resource_group_name                     = "ploceusrg000001" #Required
    application_insights_location           = "westus2"
    workspace_id                            = "ploceuslog000001" #log_analytics_workspace_name
    application_type                        = "web"
    retention_in_days                       = 90
    disable_ip_masking                      = false
    daily_data_cap_in_gb                    = 10
    daily_data_cap_notifications_disabled   = null
    sampling_percentage                     = 50
    local_authentication_disabled           = false
    internet_ingestion_enabled              = true
    internet_query_enabled                  = true
    force_customer_storage_for_profiler     = false
    application_insights_tags = {
      Created_By = "ploceus",
      Department = "CIS"
    }
  }
}

monitor_private_link_scoped_service_variables = {
  "scoped_service" = {
    linked_application_insight_name = "applicationinsights000001" # pass null if you want to use log analytics workaspace or give the application insight name here
    linked_log_workspace_name       = null                        # pass null if you want to use application insights or give the log analytics name here
    application_insights_resource_group_name ="ploceusrg000001"
    log_analytics_workspace_resource_group_name = null
    monitor_private_link_scope_name = "ploceusscope000001"
    monitor_private_link_scoped_service_name                            = "ploceusScopedservice000001"
    monitor_private_link_scoped_service_resource_group_name             = "ploceusrg000001"
    tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

log_analytics_workspace_variables = {
  "log_analytics_workspace_1" = {
    name                               = "ploceuslog000001" #Required
    location                           = "westus2"          #Required
    resource_group_name                = "ploceusrg000001" #Required
    sku                                = "PerGB2018"        #Optional
    retention_in_days                  = null               #Optional
    daily_quota_gb                     = null               #Optional
    internet_ingestion_enabled         = null               #Optional
    internet_query_enabled             = null               #Optional
    reservation_capacity_in_gb_per_day = null               #Optional
    log_analytics_workspace_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

monitor_private_link_scoped_service_sub_subscription_id      = "e228a3c6-cc6e-4fea-87f3-fafa70c85d19"
monitor_private_link_scoped_service_sub_tenant_id            = "687f51c3-0c5d-4905-84f8-97c683a5b9d1"
log_analytics_workspace_sub_subscription_id = "e228a3c6-cc6e-4fea-87f3-fafa70c85d19"
log_analytics_workspace_sub_tenant_id       = "687f51c3-0c5d-4905-84f8-97c683a5b9d1"
applicationinsight_sub_tenant_id                      = "687f51c3-0c5d-4905-84f8-97c683a5b9d1"
applicationinsight_sub_subscription_id               = "e228a3c6-cc6e-4fea-87f3-fafa70c85d19"