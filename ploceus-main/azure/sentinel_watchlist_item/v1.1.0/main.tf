data "azurerm_log_analytics_workspace" "log_analytics_workspace" {
  for_each            = var.sentinel_watchlist_item_variables
  name                = each.value.log_analytics_workspace_name
  resource_group_name = each.value.log_analytics_workspace_resource_group_name
}
data "azurerm_client_config" "subscription_id" {

}
resource "azurerm_sentinel_watchlist_item" "sentinel_watchlist_item" {
  for_each     = var.sentinel_watchlist_item_variables
  name         = each.value.sentinel_watchlist_item_name
  watchlist_id = "/subscriptions/${data.azurerm_client_config.subscription_id.subscription_id}/resourceGroups/${each.value.log_analytics_workspace_resource_group_name}/providers/Microsoft.OperationalInsights/workspaces/${each.value.log_analytics_workspace_name}/providers/Microsoft.SecurityInsights/watchlists/${each.value.sentinel_watchlist_name}"
  properties   = each.value.properties
}
