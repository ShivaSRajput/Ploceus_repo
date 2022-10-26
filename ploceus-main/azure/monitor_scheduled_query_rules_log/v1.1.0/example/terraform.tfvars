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

#LOG ANALYTICS WORKSPACE
log_analytics_workspace_variables = {
  "log_analytics_workspace_1" = {
    name                               = "ploceuslog000001" #Required
    location                           = "westus2"          #Required
    resource_group_name                = "ploceusrg000001"  #Required
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

#MONITOR SCHEDULED QUERY RULES LOG 
monitor_scheduled_query_rules_log_variables = {
  "monitor_scheduled_query_rules_log_1" = {
    location            = "westus2"
    resource_group_name = "ploceusrg000001"
    name                = "ploceusmonitorScheduledQueryLog000001"
    workspace_name      = "ploceuslog000001"
    metric_name         = "Average_% Idle Time"
    dimension_name      = "Computer"
    dimension_operator  = "Include"
    dimension_values    = ["targetVM"]
    description         = "Scheduled query rule LogToMetric"
    enabled             = true

    monitor_scheduled_query_rules_log_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
} 

log_analytics_workspace_subscription_id            = "4b19f8b4-d51d-457c-ba9f-f870519c8768"
log_analytics_workspace_tenant_id                  = "687f51c3-0c5d-4905-84f8-97c683a5b9d1"
monitor_scheduled_query_rules_log_subscription_id = "4b19f8b4-d51d-457c-ba9f-f870519c8768"
monitor_scheduled_query_rules_log_tenant_id       = "687f51c3-0c5d-4905-84f8-97c683a5b9d1"