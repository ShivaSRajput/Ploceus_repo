#Diagnostic Settings
module "diagnostic_settings" {
  source              = "../"
  diagnostic_settings = var.diagnostic_settings
  providers = {
    azurerm.monitor_diagnostic_sub      = azurerm.monitor_diagnostic_sub
    azurerm.log_analytics_workspace_sub = azurerm.log_analytics_workspace_sub
    azurerm.storage_resource_sub        = azurerm.storage_resource_sub
    azurerm.eventhub_sub                = azurerm.eventhub_sub
  }
  depends_on = [
    module.log_storage_account,
    module.app_storage_account
  ]
}

module "app_storage_account" {
  source                    = "../../../storage_account/v1.1.0"
  storage_account_variables = var.app_storage_account_variables
  providers = {
    azurerm = azurerm.monitor_diagnostic_sub
   }
  depends_on                = [module.app_resource_group]
}

module "app_resource_group" {
  source = "../../../resource_group/v1.1.0"
  providers = {
    azurerm = azurerm.monitor_diagnostic_sub
  }
  resource_group_variables = var.app_resource_group_variables
}

module "log_storage_account" {
  source                    = "../../../storage_account/v1.1.0"
  storage_account_variables = var.log_storage_account_variables
  providers = {
    azurerm = azurerm.storage_resource_sub
   }
  depends_on                = [module.log_resource_group]
}

module "log_resource_group" {
  source = "../../../resource_group/v1.1.0"
  providers = {
    azurerm = azurerm.storage_resource_sub
  }
  resource_group_variables = var.log_resource_group_variables
}