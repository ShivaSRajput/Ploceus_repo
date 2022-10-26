output "vpn_server_config_id" {
  value = { for k , v in azurerm_vpn_server_configuration.vpn_server_configuration : k => v.id }
}