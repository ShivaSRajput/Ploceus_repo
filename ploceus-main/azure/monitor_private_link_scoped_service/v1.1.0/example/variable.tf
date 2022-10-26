variable "resource_group_variables" {
  description = "Map of Resource groups"
  type = map(object({
    name                = string
    location            = string
    resource_group_tags = map(string)
  }))
  default = {}
}

variable "monitor_private_link_scoped_service_variables" {
  type = map(object({
    monitor_private_link_scoped_service_name                            = string
    monitor_private_link_scoped_service_resource_group_name             = string
    monitor_private_link_scope_name = string
    linked_application_insight_name = string
    linked_log_workspace_name       = string
    application_insights_resource_group_name = string
    log_analytics_workspace_resource_group_name = string
    
    tags = map(string)
  }))
  description = "variable for private link scoped service details"
  default     = {}
}
variable "monitor_private_link_scope" {
  type = map(object({
    name                = string
    resource_group_name = string
    tags                = map(string)
  }))
  description = "variable for private link scope details"
  default     = {}
}
variable "application_insights_variables" {
  type = map(object({
    application_insights_name                  = string
    resource_group_name                        = string
    application_insights_location              = string
    workspace_id                               = string
    application_type                           = string
    retention_in_days                          = number
    disable_ip_masking                         = bool
    daily_data_cap_in_gb                       = number
    daily_data_cap_notifications_disabled      = string
    sampling_percentage                        = number
    local_authentication_disabled              = bool
    internet_ingestion_enabled                 = bool
    internet_query_enabled                     = bool
    force_customer_storage_for_profiler        = bool
    application_insights_tags                  = map(string)
  }))
  default = {}
}


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
