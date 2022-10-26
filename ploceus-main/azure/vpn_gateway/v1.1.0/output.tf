#Output VPN Gateway
output "vpn_gateway_ids" {
  value = { for k, v in azurerm_vpn_gateway.vpn_gateway : k => v.id }
  description = "VPN Gateways Outputs"
}