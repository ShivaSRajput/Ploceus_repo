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
module "Virtual_WAN" {
  source                = "../../../virtual_wan/v1.0.0"
  virtual_wan_variables = var.virtual_wan_variables
  depends_on = [
    module.resource_group
  ]
}

#Virtual Hub
module "virtual_hub" {
  source                = "../../../virtual_hub/v1.0.0"
  virtual_hub_variables = var.virtual_hub_variables
  depends_on = [
    module.Virtual_WAN
  ]
}

#Virtual Hub Connection
module "virtual_hub_connection" {
  source                           = "../../../virtual_hub_connection/v1.0.0"
  virtual_hub_connection_variables = var.virtual_hub_connection_variables
  depends_on                       = [module.resource_group, module.vnet, module.Virtual_WAN, module.virtual_hub]
}

#Virtual Hub Route Table
module "virtual_hub_route_table" {
  source                               = "../"
  virtual_hub_route_table_variables = var.virtual_hub_route_table_variables
  depends_on = [
    module.virtual_hub
  ]
}

