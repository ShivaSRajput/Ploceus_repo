#sentinel dataconnector office 365 variables
variable "sentinel_data_connector_office_365_variables" {
  type = map(object({
    log_analytics_workspace_name                = string
    log_analytics_workspace_resource_group_name = string
    sentinel_data_connector_office_365_name     = string
    exchange_enabled                            = bool
    sharepoint_enabled                          = bool
    teams_enabled                               = bool
  }))
}
