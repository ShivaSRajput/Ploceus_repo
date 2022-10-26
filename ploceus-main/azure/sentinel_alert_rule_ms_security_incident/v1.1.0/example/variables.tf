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

#sentinel alert rule ms security incident variables
variable "sentinel_alert_rule_ms_security_incident_variables" {
  type = map(object({
    log_analytics_workspace_name                  = string
    log_analytics_workspace_resource_group_name   = string
    sentinel_alert_rule_ms_security_incident_name = string
    display_name                                  = string
    product_filter                                = string
    severity_filter                               = list(string)
    alert_rule_template_guid                      = string
    description                                   = string
    enabled                                       = bool
    display_name_filter                           = list(string)
    display_name_exclude_filter                   = list(string)
  }))
}
