data "azurerm_log_analytics_workspace" "log_analytics_workspace" {
  for_each            = var.sentinel_data_connector_azure_active_directory_variables
  name                = each.value.log_analytics_workspace_name
  resource_group_name = each.value.log_analytics_workspace_resource_group_name
}
data "azurerm_client_config" "tenant_id" {

}

resource "azurerm_sentinel_data_connector_azure_active_directory" "sentinel_data_connector_azure_active_directory" {
  for_each                   = var.sentinel_data_connector_azure_active_directory_variables
  name                       = each.value.sentinel_data_connector_azure_active_directory_name
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.log_analytics_workspace[each.key].id
  tenant_id                  = data.azurerm_client_config.tenant_id.tenant_id
}
