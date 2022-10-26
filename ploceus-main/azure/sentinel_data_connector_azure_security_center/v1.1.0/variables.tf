#sentinel data connector azure security center variables
variable "sentinel_data_connector_azure_security_center_variables" {
  type = map(object({
    log_analytics_workspace_name                       = string
    log_analytics_workspace_resource_group_name        = string
    sentinel_data_connector_azure_security_center_name = string
  }))
}
