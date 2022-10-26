#RESOURCE GROUP
module "resource_group" {
  source                   = "../../../resource_group/v1.1.0"
  providers = {
    azurerm           = azurerm.log_analytics_workspace_sub
  }
  resource_group_variables = var.resource_group_variables
}

#LOG ANALYTICS WORKSPACE
module "log_analytics_workspace" {
  source                            = "../../../log_analytics_workspace/v1.1.0"
  providers = {
    azurerm          = azurerm.log_analytics_workspace_sub
  }
  log_analytics_workspace_variables = var.log_analytics_workspace_variables
  depends_on                        = [module.resource_group]
}

#MONITOR SCHEDULED QUERY RULES LOG
module "monitor_scheduled_query_rules_log" {
  source                           = "../"
  providers = {
    azurerm.log_analytics_workspace_sub           = azurerm.log_analytics_workspace_sub
    azurerm.monitor_scheduled_query_rules_log_sub = azurerm.monitor_scheduled_query_rules_log_sub
  }
  monitor_scheduled_query_rules_log_variables = var.monitor_scheduled_query_rules_log_variables
  depends_on                                  = [module.resource_group,module.log_analytics_workspace]
}
