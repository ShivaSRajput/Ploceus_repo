module "resource_group" {
  source                   = "../../../resource_group/v1.1.0"
  resource_group_variables = var.resource_group_variables
}

module "vnet" {
  source          = "../../../vnet/v1.1.0"
  vnets_variables = var.vnets_variables
  depends_on = [
    module.resource_group
  ]
}


module "subnet" {
  source           = "../../../subnet/v1.1.0"
  subnet_variables = var.subnet_variables
  depends_on = [
    module.vnet, module.resource_group
  ]
}




module "private_endpoint" {
  source                     = "../"
  private_endpoint_variables = var.private_endpoint_variables
  # keyvault_name         = var.keyvault_name
  # keyvault_resourcegroup= var.keyvault_resourcegroup
  depends_on = [
    module.vnet, module.resource_group, module.subnet
  ]
}
