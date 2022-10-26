#Output Local Network Gateway
output "local_network_gateway" {
  value       = azurerm_local_network_gateway.local_network_gateway
  description = "Local Network Gateways Outputs"
}