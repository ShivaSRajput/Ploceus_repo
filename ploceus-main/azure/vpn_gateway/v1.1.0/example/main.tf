#Resource Group
module "resource_group" {
  source                   = "../../../resource_group/v1.1.0"
  resource_group_variables = var.resource_group_variables
}


#Virtual WAN
module "virtual_wan" {
  source                = "../../../virtual_wan/v1.1.0"
  virtual_wan_variables = var.virtual_wan_variables
  depends_on = [
    module.resource_group
  ]
}

#Virtual Hub
module "virtual_hub" {
  source                = "../../../virtual_hub/v1.1.0"
  virtual_hub_variables = var.virtual_hub_variables
  depends_on = [
    module.resource_group,
    module.virtual_wan
  ]
}

#VPN Gateway
module "vpn_gateway" {
  source       = "../"
  vpn_gateways_variables = var.vpn_gateways_variables
  depends_on = [
    module.resource_group,
    module.virtual_wan,
    module.virtual_hub
  ]
}