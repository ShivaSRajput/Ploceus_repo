data "azurerm_log_analytics_workspace" "log_analytics_workspace" {
  for_each            = var.sentinel_watchlist_variables
  name                = each.value.log_analytics_workspace_name
  resource_group_name = each.value.log_analytics_workspace_resource_group_name
}

resource "azurerm_sentinel_watchlist" "sentinel_watchlist" {
  for_each                   = var.sentinel_watchlist_variables
  name                       = each.value.sentinel_watchlist_name
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.log_analytics_workspace[each.key].id
  display_name               = each.value.sentinel_watchlist_display_name
  item_search_key            = each.value.item_search_key
  description                = each.value.description
  labels                     = each.value.labels
  default_duration           = each.value.default_duration
}
