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

security_centre_workspace_variables = {
  "security_centre_workspace_1" = {
    log_analytics_name                = "ploceusscw000001"
    scope               = "/subscriptions/00000000-0000-0000-0000-000000000000"
    log_analytics_resource_group_name  = "ploceusrg000001"
  }
}

log_analytics_subscription_id   = "a43cf9e4-b2f6-4e4d-85c6-8702bc41defd"
log_analytics_tenant_id         = "687f51c3-0c5d-4905-84f8-97c683a5b9d1"
security_center_subscription_id = "a43cf9e4-b2f6-4e4d-85c6-8702bc41defd"
security_center_tenant_id       = "687f51c3-0c5d-4905-84f8-97c683a5b9d1"
