#sentinel dataconnector AWS s3 variables
variable "sentinel_data_connector_aws_s3_variables" {
  type = map(object({
    log_analytics_workspace_name                = string
    log_analytics_workspace_resource_group_name = string
    sentinel_data_connector_aws_s3_name         = string
    aws_role_arn                                = string
    destination_table                           = string
    sqs_urls                                    = list(string)
  }))
}
