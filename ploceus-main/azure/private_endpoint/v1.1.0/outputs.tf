
output "pe_ids" {
  value       = [for pe in azurerm_private_endpoint.this : pe.id]
  description = "Private Endpoint Id's"
}
