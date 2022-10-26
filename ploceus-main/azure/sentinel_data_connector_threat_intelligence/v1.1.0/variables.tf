#sentinel data connector threat intelligence variables
variable "sentinel_data_connector_threat_intelligence_variables" {
  type = map(object({
    log_analytics_workspace_name                     = string
    log_analytics_workspace_resource_group_name      = string
    sentinel_data_connector_threat_intelligence_name = string
  }))
}


