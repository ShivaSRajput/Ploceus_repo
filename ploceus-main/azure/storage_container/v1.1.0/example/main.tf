#RESOURCE GROUP
module "resource_group" {
  source                   = "../../../resource_group/v1.1.0"
  resource_group_variables = var.resource_group_variables
}

#STORAGE ACCOUNT
module "storage_account" {
  source                    = "../../../storage_account/v1.1.0"
  storage_account_variables = var.storage_account_variables
  depends_on                = [module.resource_group]
}
#STORAGE CONTAINER
module "storage_container" {
  source                      = "../"
  storage_container_variables = var.storage_container_variables
  depends_on                  = [module.storage_account]
}