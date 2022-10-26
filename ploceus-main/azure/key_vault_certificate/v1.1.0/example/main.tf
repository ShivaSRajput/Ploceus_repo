module "resource_group" {
  source                   = "../../../resource_group/v1.1.0"
  resource_group_variables = var.resource_group_variables
}
module "key_vault" {
  source              = "../../../key_vault/v1.1.0"
  key_vault_variables = var.key_vault_variables
  depends_on          = [module.resource_group]
}
#KEY VAULT_certificate
module "key_vault_certificate" {
  source                          = "../"
  key_vault_certificate_variables = var.key_vault_certificate_variables
  depends_on                      = [module.key_vault]
}
