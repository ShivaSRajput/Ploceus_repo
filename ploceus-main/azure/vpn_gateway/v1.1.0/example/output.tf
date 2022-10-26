#Output VPN Gateway
output "VPN_Gateway" {
  value       = module.vpn_gateway.vpn_gateway_ids
  description = "VPN Gateways Outputs"
}