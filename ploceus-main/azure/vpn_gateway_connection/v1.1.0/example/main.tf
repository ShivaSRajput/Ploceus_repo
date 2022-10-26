#Resource Group
module "resource_group" {
  providers = {
    azurerm = azurerm.vpn_gateway_subscription
  }
  source                   = "../../../resource_group/v1.1.0"
  resource_group_variables = var.resource_group_variables
}


#Virtual WAN
module "virtual_wan" {
  providers = {
    azurerm = azurerm.vpn_gateway_subscription
  }
  source                = "../../../virtual_wan/v1.1.0"
  virtual_wan_variables = var.virtual_wan_variables
  depends_on = [
    module.resource_group
  ]
}

#Virtual Hub
module "virtual_hub" {
  providers = {
    azurerm = azurerm.vpn_gateway_subscription
  }
  source                = "../../../virtual_hub/v1.1.0"
  virtual_hub_variables = var.virtual_hub_variables
  depends_on = [
    module.resource_group,
    module.virtual_wan
  ]
}

#VPN Site
module "vpn_site" {
  providers = {
    azurerm = azurerm.vpn_site_subscription
  }
  source    = "../../../vpn_site/v1.1.0"
  vpn_site_variables = var.vpn_site_variables
  depends_on = [
    module.resource_group,
    module.virtual_wan,
    module.virtual_hub
  ]
}


#VPN Gateway
module "vpn_gateway" {
  providers = {
    azurerm = azurerm.vpn_gateway_subscription
  }
  source       = "../../../vpn_gateway/v1.1.0"
  vpn_gateway_variables = var.vpn_gateway_variables
  depends_on = [
    module.resource_group,
    module.virtual_wan,
    module.virtual_hub
  ]
}

module "vpn_gateway_connection" {
  providers = {
    azurerm.vpn_gateway_subscription = azurerm.vpn_gateway_subscription
    azurerm.vpn_site_subscription    = azurerm.vpn_site_subscription
  }
  source                           = "../"
  vpn_gateway_connection_variables = var.vpn_gateway_connection_variables
  depends_on = [
    module.resource_group,
    module.virtual_wan,
    module.virtual_hub,
    module.vpn_gateway,
    module.vpn_site
  ]
}
