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
