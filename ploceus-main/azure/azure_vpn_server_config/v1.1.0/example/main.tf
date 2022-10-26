module "resourcegrp" {
  source                   = "../../../resource_group/v1.0.0"
  resource_group_variables = var.resource_group_variables
}

module "az_vwan" {
  source                = "../../../virtual_wan/v1.0.0"
  virtual_wan_variables = var.virtual_wan_variables
  depends_on = [
    module.resourcegrp
  ]
}

module "vpn_config" {
  source            = "../"
  vpn_server_config = var.vpn_server_config
  depends_on = [
    module.az_vwan
  ]
}