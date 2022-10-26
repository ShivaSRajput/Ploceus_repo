
locals {
  is_log_analytics_variables = { for k, v in var.monitor_private_link_scoped_service_variables : k => v if lookup(v, "linked_log_workspace_name", null) != null }
}

locals {
  is_application_insights_variables = { for k, v in var.monitor_private_link_scoped_service_variables : k => v if lookup(v, "linked_application_insight_name", null) != null }
}
data "azurerm_application_insights" "application_insights" {
  provider = azurerm.applicationinsight_sub  
  for_each = local.is_application_insights_variables
  name     = each.value.linked_application_insight_name
  resource_group_name =  each.value.application_insights_resource_group_name
  }

data "azurerm_log_analytics_workspace" "log_analytics_workspace" {
  provider = azurerm.log_analytics_workspace_sub
  for_each = local.is_log_analytics_variables
  name     = each.value.linked_log_workspace_name
  resource_group_name =  each.value.log_analytics_workspace_resource_group_name
}

resource "azurerm_monitor_private_link_scoped_service" "monitor_private_link_scoped_service" {
  provider = azurerm.monitor_private_link_scoped_service_sub
  for_each            = var.monitor_private_link_scoped_service_variables
  name                = each.value.monitor_private_link_scoped_service_name
  resource_group_name = each.value.monitor_private_link_scoped_service_resource_group_name
  scope_name           = each.value.monitor_private_link_scope_name
  linked_resource_id   =  each.value.linked_application_insight_name != null ? data.azurerm_application_insights.application_insights[each.key].id : data.azurerm_log_analytics_workspace.log_analytics_workspace[each.key].id // : each.value.linked_log_workspace_name != null ? data.azurerm_log_analytics_workspace.log_analytics_workspace[each.key].id ? data.azurerm_log_analytics_workspace.log_analytics_workspace[each.key].id: data.azurerm_application_insights.appinsight[each.key].id)

}
