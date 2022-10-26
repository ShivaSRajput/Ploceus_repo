
output "pe_ids" {
  value       = [for pe in azurerm_private_endpoint.this : pe.id]
  description = "Private Endpoint Id's"
}

output "private_ip_addr" {
  value       = [for pe in azurerm_private_endpoint.this : pe.custom_dns_configs.*.ip_addresses]
  description = "Private Endpoint IP addr"

}
