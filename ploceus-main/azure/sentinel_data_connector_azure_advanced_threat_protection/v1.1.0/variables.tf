#sentinel dataconnector azure advanced threat protection variables
variable "sentinel_data_connector_azure_advanced_threat_protection_variables" {
  type = map(object({
    log_analytics_workspace_name                                  = string
    log_analytics_workspace_resource_group_name                   = string
    sentinel_data_connector_azure_advanced_threat_protection_name = string
  }))
}
