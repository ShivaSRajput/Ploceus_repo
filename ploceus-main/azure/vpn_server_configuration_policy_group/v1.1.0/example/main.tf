module "resource_group" {
  source                   = "../../../resource_group/v1.1.0"
  resource_group_variables = var.resource_group_variables
}

module "vpn_server_config" {
  source            = "../../../azure_vpn_server_config/v1.1.0"
  vpn_server_config = var.vpn_server_config
  depends_on = [
    module.resource_group
  ]
}

module "vpn_server_configuration_policy_group" {
  source            = "../"
  vpn_server_configuration_policy_group_variables = var.vpn_server_configuration_policy_group_variables
  depends_on = [
    module.resource_group, module.vpn_config
  ]
}
