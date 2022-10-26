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
