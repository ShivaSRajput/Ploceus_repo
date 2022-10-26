data "azurerm_log_analytics_workspace" "log_analytics_workspace" {
  for_each            = var.sentinel_data_connector_azure_security_center_variables
  name                = each.value.log_analytics_workspace_name
  resource_group_name = each.value.log_analytics_workspace_resource_group_name
}


data "azurerm_client_config" "subscription_id" {

}

resource "azurerm_sentinel_data_connector_azure_security_center" "sentinel_data_connector_azure_security_center" {
  for_each                   = var.sentinel_data_connector_azure_security_center_variables
  name                       = each.value.sentinel_data_connector_azure_security_center_name
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.log_analytics_workspace[each.key].id
  subscription_id            = data.azurerm_client_config.subscription_id.subscription_id

}
