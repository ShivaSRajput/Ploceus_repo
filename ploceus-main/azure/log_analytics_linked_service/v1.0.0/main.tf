#AUTOMATION ACCOUNT
data "azurerm_automation_account" "automation_account" {
  for_each            = var.log_analytics_linked_service_variables
  name                = each.value.automation_account_name
  resource_group_name = each.value.resource_group_name
}

#LOG ANALYTICS WORKSPACE
data "azurerm_log_analytics_workspace" "log_analytics_workspace" {
  for_each            = var.log_analytics_linked_service_variables
  name                = each.value.log_analytics_workspace_name
  resource_group_name = each.value.resource_group_name
}

#LOG ANALYTICS LINKED SERVICE
resource "azurerm_log_analytics_linked_service" "log_analytics_linked_service" {
  for_each            = var.log_analytics_linked_service_variables
  resource_group_name = each.value.resource_group_name
  workspace_id        = data.azurerm_log_analytics_workspace.log_analytics_workspace[each.key].id
  read_access_id      = data.azurerm_automation_account.automation_account[each.key].id
}
