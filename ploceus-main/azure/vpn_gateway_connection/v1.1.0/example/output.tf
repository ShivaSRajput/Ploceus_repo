#Output VPN Gateway Connection
output "vpn_gateway_connection" {
  value       = module.vpn_gateway_connection.vpn_gateway_connections_id
  description = "VPN Gateway Connection Outputs"
}