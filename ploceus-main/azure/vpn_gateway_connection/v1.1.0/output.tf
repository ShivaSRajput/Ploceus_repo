#Output VPN Gateway Connection
output "vpn_gateway_connections_id" {
  value       = { for k, v in azurerm_vpn_gateway_connection.vpn_gateway_connection : k => v.id }
  description = "VPN Gateway Connections Output"
}