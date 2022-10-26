#APP SERVICE PLAN FOR FUNCTION APP
module "app_service_plan" {
  source                     = "../../../../app_service_plan/v1.0.0"
  app_service_plan_variables = var.app_service_plan_variables
}

#STORAGE ACCOUNT FOR FUNCTION APP
module "storage_account" {
  source                    = "../../../../storage_account/v1.0.0"
  storage_account_variables = var.storage_account_variables
}

#FUNCTION APP
module "function_app" {
  source                 = "../../../../function_app/v1.0.0"
  function_app_variables = var.function_app_variables
  depends_on = [module.app_service_plan,
    module.storage_account
  ]
}

#Key Vault
module "key_vault" {
  source              = "../../../../key_vault/v1.0.0"
  key_vault_variables = var.key_vault_variables
}

#ROLE ASSIGNMENT - Function APP 1
module "functionapp_to_keyvault_role_assignment_1" {
  source                                      = "../"
  function_keyvault_role_assignment_variables = var.function_keyvault_role_assignment_variables
  function_app_principal_id                   = module.function_app.function_app_principle_id[0]
  depends_on = [module.app_service_plan,
    module.storage_account,
    module.key_vault,
    module.function_app
  ]
}

#ROLE ASSIGNMENT - Function APP 2
module "functionapp_to_keyvault_role_assignment_2" {
  source                                      = "../"
  function_keyvault_role_assignment_variables = var.function_keyvault_role_assignment_variables
  function_app_principal_id                   = module.function_app.function_app_principle_id[1]
  depends_on = [module.app_service_plan,
    module.storage_account,
    module.key_vault,
    module.function_app
  ]
}


