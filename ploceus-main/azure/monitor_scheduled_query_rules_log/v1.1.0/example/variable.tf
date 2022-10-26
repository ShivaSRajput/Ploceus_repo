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

#MONITOR SCHEDULED QUERY RULES LOG VARIABLE
variable "monitor_scheduled_query_rules_log_variables" {
  type = map(object({
    location                               = string
    name                                   = string
    workspace_name                         = string
    metric_name                            = string
    dimension_name                         = string
    dimension_operator                     = string
    dimension_values                       = list(string)
    resource_group_name                    = string
    description                            = string
    enabled                                = bool
    monitor_scheduled_query_rules_log_tags = map(string)
  }))
}