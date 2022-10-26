#LOG ANALYTICS SOLUTION 
data "azurerm_log_analytics_workspace" "log_analytics_workspace" {
  provider            = azurerm.log_analytics_workspace_sub
  for_each            = var.monitor_scheduled_query_rules_log_variables
  name                = each.value.workspace_name
  resource_group_name = each.value.resource_group_name
}

#MONITOR SCHEDULED QUERY RULES LOG

resource "azurerm_monitor_scheduled_query_rules_log" "monitor_scheduled_query_rules_log" {
  provider              = azurerm.monitor_scheduled_query_rules_log_sub
  for_each              = var.monitor_scheduled_query_rules_log_variables
  location              = each.value.location
  name                  = each.value.name
  resource_group_name   = each.value.resource_group_name
  data_source_id        = data.azurerm_log_analytics_workspace.log_analytics_workspace[each.key].id
  description           = each.value.description
  enabled               = each.value.enabled

  criteria {
    metric_name = each.value.metric_name
    dimension {
    name      = each.value.dimension_name
    operator  = each.value.dimension_operator
    values    = each.value.dimension_values
    }
  }

  tags = merge(each.value.monitor_scheduled_query_rules_log_tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
  lifecycle { ignore_changes = [tags["Created_Time"]] }
}