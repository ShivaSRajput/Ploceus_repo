#RESOURCE GROUP
module "resource_group" {
  source                   = "../../../resource_group/v1.1.0"
  resource_group_variables = var.resource_group_variables
}

#KEY VAULT
module "key_vault" {
  source              = "../../../key_vault/v1.1.0"
  key_vault_variables = var.key_vault_variables
  depends_on          = [module.resource_group]
}


#KEY VAULT
module "key_vault_key" {
  source                  = "../"
  key_vault_key_variables = var.key_vault_key_variables
  depends_on              = [module.key_vault]
}

