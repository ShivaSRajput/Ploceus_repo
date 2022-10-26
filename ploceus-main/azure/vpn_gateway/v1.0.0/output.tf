#Output VPN Gateway
output "vpn_gateways" {
  value       = azurerm_vpn_gateway.vpn_gateway
  description = "VPN Gateways Outputs"
}