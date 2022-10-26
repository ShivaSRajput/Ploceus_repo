#sentinel dataconnector AWS cloud trail variables
variable "sentinel_data_connector_aws_cloud_trail_variables" {
  type = map(object({
    log_analytics_workspace_name                 = string
    log_analytics_workspace_resource_group_name  = string
    sentinel_data_connector_aws_cloud_trail_name = string
    aws_role_arn                                 = string
  }))
}
