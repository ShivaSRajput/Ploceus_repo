

variable "monitor_private_link_scoped_service_variables" {
  type = map(object({
    monitor_private_link_scoped_service_name                                 = string
    monitor_private_link_scoped_service_resource_group_name                  = string
    monitor_private_link_scope_name      = string
    linked_application_insight_name                  = string
    linked_log_workspace_name                          =string
    application_insights_resource_group_name = string
    log_analytics_workspace_resource_group_name = string
    tags = map(string)
  }))
  description = "variable for private link scoped service details"
  default     = {}
}
