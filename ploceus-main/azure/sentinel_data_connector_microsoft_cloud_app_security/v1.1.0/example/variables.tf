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

#LOG ANALYTICS WORKSPACE VARIABLE
variable "log_analytics_workspace_variables" {
  type = map(object({
    name                               = string
    location                           = string
    resource_group_name                = string
    sku                                = string
    retention_in_days                  = number
    daily_quota_gb                     = number
    internet_ingestion_enabled         = bool
    internet_query_enabled             = bool
    reservation_capacity_in_gb_per_day = number
    log_analytics_workspace_tags       = map(string)
  }))
}

#sentinel dataconnector microsoft cloud app security variables
variable "sentinel_data_connector_microsoft_cloud_app_security_variables" {
  type = map(object({
    log_analytics_workspace_name                              = string
    log_analytics_workspace_resource_group_name               = string
    sentinel_data_connector_microsoft_cloud_app_security_name = string
    alerts_enabled                                            = bool
    discovery_logs_enabled                                    = bool
  }))
}
