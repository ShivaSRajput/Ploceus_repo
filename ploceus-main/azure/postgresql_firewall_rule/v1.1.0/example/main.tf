#Resource Group
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

#Postgresql Server
module "postgresql_server" {
  source = "../../../postgresql_server/v1.1.0"
  providers = {
    azurerm.postgresql_server = azurerm.postgresql_server
  }
  postgresql_server_variables = var.postgresql_server_variables
  depends_on                  = [module.resource_group, module.key_vault]
}

#Postgresql Firewall Rule
module "postgresql_firewall_rule" {
  source                             = "../"
  postgresql_firewall_rule_variables = var.postgresql_firewall_rule_variables
  depends_on                         = [module.resource_group, module.postgresql_server]
}