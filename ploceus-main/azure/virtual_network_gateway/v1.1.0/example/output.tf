#Output Virtual Network Gateway
output "virtual_network_gateway_outputs" {
  value       = module.virtual_network_gateway.virtual_network_gateway_outputs
  description = "Virtual Network Gateways Outputs"
}