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

variable "security_centre_automation_variables" {
  type = map(object({
    name                = string
    namespace           = string
    resource_group_name = string
    location            = string
    scopes              = list(string)
    event_source        = string
    property_path       = string
    operator            = string
    expected_value      = string
    property_type       = string
    actions = list(object({
      actions_type                = string
      actions_resource_name       = string
      actions_resource_group_name = string
      actions_connection_string   = string
      actions_trigger_url         = string
      actions_eventhub_namespace  = string

    }))
  }))
}
