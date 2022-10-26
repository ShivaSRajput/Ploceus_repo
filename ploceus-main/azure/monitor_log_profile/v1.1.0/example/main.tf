#Variable Definition for monitor log profiles
module "monitor_log_profiles" {
  source               = "../"
  monitor_log_profiles = var.monitor_log_profiles
  providers = {
    azurerm.main_sub       = azurerm.main_sub
    azurerm.storage_sub    = azurerm.storage_sub
    azurerm.servicebus_sub = azurerm.servicebus_sub
  }
  depends_on = [
    module.storage_account
  ]
}

module "storage_account" {
  source                    = "../../../storage_account/v1.1.0"
  storage_account_variables = var.storage_account_variables
  providers = {
    azurerm = azurerm.storage_sub
  }
  depends_on = [module.resource_group]
}

module "resource_group" {
  source = "../../../resource_group/v1.1.0"
  providers = {
    azurerm = azurerm.storage_sub
  }
  resource_group_variables = var.resource_group_variables
}
