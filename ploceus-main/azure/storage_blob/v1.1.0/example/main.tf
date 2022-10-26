module "resource_group" {
  source                   = "../../../resource_group/v1.1.0"
  resource_group_variables = var.resource_group_variables
}

module "storage_account" {
  source                    = "../../../storage_account/v1.1.0"
  storage_account_variables = var.storage_account_variables
  depends_on                = [module.resource_group]
}
  
module "storage_container" {
  source                      = "../../../storage_container/v1.1.0"
  storage_container_variables = var.storage_container_variables
  depends_on                  = [module.storage_account]
}
  
module "storage_blob" {
  source                    = "../"
  storage_blob_variables = var.storage_blob_variables
  depends_on                = [module.resource_group, module.storage_account, modulestorage_container]
}


