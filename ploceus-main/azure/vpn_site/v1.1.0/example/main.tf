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

# VPN Site
module "vpn_site" {
  source    = "../"
  vpn_site_variables = var.vpn_site_variables
  depends_on = [
    module.resource_group,
    module.virtual_wan
  ]
}