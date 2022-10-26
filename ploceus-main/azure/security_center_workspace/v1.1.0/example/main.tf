#RESOURCE GROUP
module "resource_group" {
  providers = {
    azurerm = azurerm.log_analytics_sub
  }
  source                   = "../../../resource_group/v1.1.0"
  resource_group_variables = var.resource_group_variables
}

module "log_analytics_workspace" {
  providers = {
    azurerm = azurerm.log_analytics_sub
  }
  source                            = "../../../log_analytics_workspace/v1.1.0"
  log_analytics_workspace_variables = var.log_analytics_workspace_variables
  depends_on                        = [module.resource_group]
}

module "security_centre_workspace" {
  providers = {
    azurerm.log_analytics_sub   = azurerm.log_analytics_sub
    azurerm.security_center_sub = azurerm.security_center_sub
  }
  source                              = "../"
  security_centre_workspace_variables = var.security_centre_workspace_variables
  depends_on                          = [module.log_analytics_workspace]

}
