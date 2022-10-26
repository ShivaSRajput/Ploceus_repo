# #APPLICATION INSIGHTS FOR ML
module "application_insights" {
  source                         = "../../../application_insights/v1.0.0"
  application_insights_variables = var.application_insights_variables
}


#STORAGE ACCOUNT FOR ML
module "storage_account" {
  source                    = "../../../storage_account/v1.0.0"
  storage_account_variables = var.storage_account_variables
}


#KEY VAULT FOR ML
module "key_vault" {
  source              = "../../../key_vault/v1.0.0"
  key_vault_variables = var.key_vault_variables
}


#CONTAINER REGISTRY FOR ML
# module "container_registry" {
#   source                       = "../../../container_registry/v1.0.0"
#   container_registry_variables = var.container_registry_variables
# }

#MACHINE LEARNING
module "machine_learning" {
  source                     = "../"
  machine_learning_variables = var.machine_learning_variables
  depends_on = [module.application_insights,
    module.storage_account,
    module.key_vault,
    #  module.container_registry
  ]
}
