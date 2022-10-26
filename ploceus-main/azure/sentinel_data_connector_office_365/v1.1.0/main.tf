data "azurerm_log_analytics_workspace" "log_analytics_workspace" {
  for_each            = var.sentinel_data_connector_office_365_variables
  name                = each.value.log_analytics_workspace_name
  resource_group_name = each.value.log_analytics_workspace_resource_group_name
}
data "azurerm_client_config" "tenant_id" {

}
resource "azurerm_sentinel_data_connector_office_365" "sentinel_data_connector_office_365" {
  for_each                   = var.sentinel_data_connector_office_365_variables
  name                       = each.value.sentinel_data_connector_office_365_name
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.log_analytics_workspace[each.key].id
  exchange_enabled           = each.value.exchange_enabled
  sharepoint_enabled         = each.value.sharepoint_enabled
  teams_enabled              = each.value.teams_enabled
  tenant_id                  = data.azurerm_client_config.tenant_id.tenant_id
}
