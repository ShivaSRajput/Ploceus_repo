#Output Virtual Network Gateway
output "virtual_network_gateway_outputs" {
  value       = azurerm_virtual_network_gateway.virtual_network_gateway
  description = "Virtual Network Gateways Outputs"
}