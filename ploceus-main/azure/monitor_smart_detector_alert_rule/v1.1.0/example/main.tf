#Module for monitor_smart_detector_alert_rules
module "monitor_smart_detector_alert_rules" {
  source                     = "../"
  smart_detector_alert_rules = var.smart_detector_alert_rules
  providers = {
    azurerm.scope_resouce_sub             = azurerm.scope_resouce_sub
    azurerm.action_group_sub              = azurerm.action_group_sub
    azurerm.smart_detector_alert_rule_sub = azurerm.smart_detector_alert_rule_sub
  }
  depends_on = [
    module.application_insights,
    module.action_group
  ]
}


module "action_group" {
  source                         = "../../../monitor_action_group/v1.1.0"
  monitor_action_group_variables = var.monitor_action_group_variables
  providers = {
    azurerm = azurerm.action_group_sub
  }
  depends_on = [
    module.resource_group
  ]
}


#RESOURCE GROUP
module "resource_group" {
  source                   = "../../../resource_group/v1.1.0"
  resource_group_variables = var.resource_group_variables
  providers = {
    azurerm = azurerm.scope_resouce_sub
  }
}

#LOG ANALYTICS WORKSPACE
module "log_analytics_workspace" {
  source                            = "../../../log_analytics_workspace/v1.1.0"
  log_analytics_workspace_variables = var.log_analytics_workspace_variables
  depends_on                        = [module.resource_group]
  providers = {
    azurerm = azurerm.scope_resouce_sub
  }
}

#APPINSIGHTS 
module "application_insights" {
  source                         = "../../../application_insights/v1.1.0"
  application_insights_variables = var.application_insights_variables
  providers = {
    azurerm = azurerm.scope_resouce_sub
  }
  depends_on = [module.resource_group, module.log_analytics_workspace]
}
