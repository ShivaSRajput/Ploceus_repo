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
    name                               = "ploceuslaw000001" #Required
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
#sentinel dataconnector AWS cloud trail variables
sentinel_data_connector_aws_cloud_trail_variables = {
  "sentinel_data_connector_aws_cloud_trail_1" = {
    log_analytics_workspace_name                 = "ploceuslaw000001"
    log_analytics_workspace_resource_group_name  = "ploceusrg000001"
    sentinel_data_connector_aws_cloud_trail_name = "ploceussentinelawscloudtrail000001"
    aws_role_arn                                 = "arn:aws:iam::000000000000:role/role1"
  }
}
