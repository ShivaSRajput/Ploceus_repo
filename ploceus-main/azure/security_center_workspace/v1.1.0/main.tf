data "azurerm_log_analytics_workspace" "log_analytics_workspace" {
  provider            = azurerm.log_analytics_sub
  for_each            = var.security_centre_workspace_variables
  name                = each.value.log_analytics_name
  resource_group_name = each.value.log_analytics_resource_group_name
}

resource "azurerm_security_center_workspace" "security_centre_workspace" {
  provider     = azurerm.security_center_sub
  for_each     = var.security_centre_workspace_variables
  scope        = each.value.scope
  workspace_id = data.azurerm_log_analytics_workspace.log_analytics_workspace[each.key].id
}
