#RESOURCE GROUP
module "resource_group" {
  source                   = "../../../resource_group/v1.1.0"
  resource_group_variables = var.resource_group_variables
}

#storage Account
module "storage_account" {
  source                                    = "../../../storage_account/v1.1.0"
  storage_account_variables                 = var.storage_account_variables
  depends_on                                = [module.resource_group]
}

#datalake gen2 filesystem
module "azurerm_storage_data_lake_gen2_filesystem" {
  source                                     = "../"
  storage_data_lake_gen2_filesystem_variable = var.storage_data_lake_gen2_filesystem_variable
  depends_on                                 = [module.storage_account]
}