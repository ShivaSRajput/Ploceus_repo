module "resource_group" {
  source = "../../../resource_group/v1.1.0"
  providers = {
    azurerm = azurerm.target_resource_sub
  }
  resource_group_variables = var.resource_group_variables
}

module "storage_account" {
  source = "../../../storage_account/v1.1.0 "
  providers = {
    azurerm = azurerm.target_resource_sub
  }
  storage_account_variables = var.storage_account_variables
  depends_on = [
    module.resource_group
  ]
}
module "advanced_threat_protection" {
  source = "../"
  providers = {

    azurerm.target_resource_sub            = azurerm.target_resource_sub
    azurerm.advanced_threat_protection_sub = azurerm.advanced_threat_protection_sub
  }
  advanced_threat_protection_variables = var.advanced_threat_protection_variables
  depends_on                           = [module.storage_account]
}
