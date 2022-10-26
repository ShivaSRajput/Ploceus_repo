variable "security_centre_workspace_variables" {
  type = map(object({
    log_analytics_name                = string
    scope               = string
    log_analytics_resource_group_name = string
  }))
}
