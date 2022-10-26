#Resource Group
module "resource_group" {
  source                   = "../../../resource_group/v1.1.0"
  resource_group_variables = var.resource_group_variables
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


#VPN Gateway
module "vpn_gateway" {
  source       = "../../../vpn_gateway/v1.0.0"
  vpn_gateways = var.vpn_gateways
  depends_on = [
    module.resource_group,
    module.Virtual_WAN,
    module.virtual_hub
  ]
}

#Virtual Hub
module "virtual_hub_security_partner_provider" {
  source                                          = "../"
  virtual_hub_security_partner_provider_variables = var.virtual_hub_security_partner_provider_variables
  depends_on = [
    module.vpn_gateway
  ]
}
