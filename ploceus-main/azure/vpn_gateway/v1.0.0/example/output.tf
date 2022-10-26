#Output VPN Gateway
output "VPN_Gateway" {
  value       = module.vpn_gateway.vpn_gateways
  description = "VPN Gateways Outputs"
}