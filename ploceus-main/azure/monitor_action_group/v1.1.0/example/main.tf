
module "action_group" {
  source                         = "../"
  monitor_action_group_variables = var.monitor_action_group_variables
providers = {
  azurerm = azurerm.action_group_sub
 }
 depends_on = [
   module.resource_group
 ]
}


module "resource_group" {
  source = "../../../resource_group/v1.1.0"
  providers = {
    azurerm = azurerm.action_group_sub
  }
  resource_group_variables = var.resource_group_variables
}