
#Monitor AAD Diagnostic Settings
module "diagnostic_settings" {
  source              = "../"
  diagnostic_settings = var.diagnostic_settings
  providers = {
    azurerm.log_analytics_workspace_sub = azurerm.log_analytics_workspace_sub
    azurerm.storage_resource_sub        = azurerm.storage_resource_sub
    azurerm.eventhub_sub                = azurerm.eventhub_sub
  }
}

module "storage_account" {
  source                    = "../../../storage_account/v1.1.0"
  storage_account_variables = var.storage_account_variables
  providers = {
    azurerm = azurerm.storage_resource_sub
   }
  depends_on                = [module.resource_group]
}

module "resource_group" {
  source = "../../../resource_group/v1.1.0"
  providers = {
    azurerm = azurerm.storage_resource_sub
  }
  resource_group_variables = var.resource_group_variables
}