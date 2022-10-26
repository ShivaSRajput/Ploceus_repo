module "resource_group" {
  source                   = "../../../resource_group/v1.1.0"
    providers = {
    azurerm = azurerm.monitor_private_link_scoped_service_sub
  }
  
  resource_group_variables = var.resource_group_variables
}

module "monitor_private_link_scoped_service" {
  source                                        = "../"
  monitor_private_link_scoped_service_variables = var.monitor_private_link_scoped_service_variables
  providers = {
    azurerm.monitor_private_link_scoped_service_sub      = azurerm.monitor_private_link_scoped_service_sub
    azurerm.log_analytics_workspace_sub                  = azurerm.log_analytics_workspace_sub
    azurerm.applicationinsight_sub                       = azurerm.applicationinsight_sub
  }
  depends_on                                    = [module.application_insights]
}

module "log_analytics_workspace" {
  source                            = "../../../log_analytics_workspace/v1.1.0"
  providers = {
    azurerm = azurerm.monitor_private_link_scoped_service_sub
  }
  log_analytics_workspace_variables = var.log_analytics_workspace_variables
  depends_on                        = [module.resource_group]
}
module "application_insights" {
  source                         = "../../../application_insights/v1.1.0"
  providers = {
    azurerm = azurerm.monitor_private_link_scoped_service_sub
  }
  application_insights_variables = var.application_insights_variables

  depends_on                     = [module.log_analytics_workspace]
}

