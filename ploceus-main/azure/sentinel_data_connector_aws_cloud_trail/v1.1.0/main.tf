data "azurerm_log_analytics_workspace" "log_analytics_workspace" {
  for_each            = var.sentinel_data_connector_aws_cloud_trail_variables
  name                = each.value.log_analytics_workspace_name
  resource_group_name = each.value.log_analytics_workspace_resource_group_name
}
resource "azurerm_sentinel_data_connector_aws_cloud_trail" "sentinel_data_connector_aws_cloud_trail" {
  for_each                   = var.sentinel_data_connector_aws_cloud_trail_variables
  name                       = each.value.sentinel_data_connector_aws_cloud_trail_name
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.log_analytics_workspace[each.key].id
  aws_role_arn               = each.value.aws_role_arn
}
