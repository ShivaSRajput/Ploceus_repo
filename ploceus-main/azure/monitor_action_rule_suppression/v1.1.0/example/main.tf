module "resource_group" {
  source = "../../../resource_group/v1.1.0"
  providers = {
    azurerm = azurerm.monitor_action_rule_suppression_sub
  }
  resource_group_variables = var.resource_group_variables
}
module "monitor_action_rule_suppression" {
  source = "../"
  providers = {
    azurerm.monitor_action_rule_suppression_sub = azurerm.monitor_action_rule_suppression_sub
    azurerm.scope_resource_sub = azurerm.scope_resource_sub
    azurerm.scope_resourcegroup_sub = azurerm.scope_resourcegroup_sub
  }
  monitor_action_rule_suppression_variables = var.monitor_action_rule_suppression_variables
  depends_on                                = [module.resource_group]
}
