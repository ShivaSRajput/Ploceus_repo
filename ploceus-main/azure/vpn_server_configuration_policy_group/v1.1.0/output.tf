output "vpn_server_configuration_policy_group_id" {
  value = { for k , v in azurerm_vpn_server_configuration_policy_group.vpn_server_configuration_policy_group : k => v.id }
}