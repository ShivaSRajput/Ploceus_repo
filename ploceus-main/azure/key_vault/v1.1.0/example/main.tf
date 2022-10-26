#RESOURCE GROUP
module "resource_group" {
  source                   = "../../../resource_group/v1.1.0"
  resource_group_variables = var.resource_group_variables
}

module "vnet" {
  source          = "../../../vnet/v1.1.0"
  vnets_variables = var.vnets_variables
  depends_on      = [module.resource_group]
}


module "subnet" {
  source           = "../../../subnet/v1.1.0"
  subnet_variables = var.subnet_variables
  depends_on       = [module.resource_group, module.vnet]
}

#KEY VAULT
module "key_vault" {
  source              = "../"
  key_vault_variables = var.key_vault_variables
  depends_on          = [module.resource_group, module.vnet, module.subnet]
}