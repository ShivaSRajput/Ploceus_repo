#Resource Group
module "resource_group" {
  source                   = "../../../resource_group/v1.1.0"
  resource_group_variables = var.resource_group_variables
}

#VNET
module "vnet" {
  source          = "../../../vnet/v1.0.0"
  vnets_variables = var.vnets_variables
  depends_on      = [module.resource_group]
}

#Virtual WAN
module "virtual_wan" {
  source                = "../../../virtual_wan/v1.0.0"
  virtual_wan_variables = var.virtual_wan_variables
  depends_on            = [module.resource_group, module.vnet]
}

#Virtual Hub
module "virtual_hub" {
  source                = "../../../vitrual_hub/v1.0.0"
  virtual_hub_variables = var.virtual_hub_variables
  depends_on            = [module.resource_group, module.vnet, module.virtual_wan]
}

#Virtual Hub Connection
module "virtual_hub_connection" {
  source                           = "../"
  virtual_hub_connection_variables = var.virtual_hub_connection_variables
  depends_on                       = [module.resource_group, module.vnet, module.virtual_wan, module.virtual_hub]
}

