#Output DNS Zone PTR Record
output "dns_ptr_record" {
  value       = azurerm_dns_ptr_record.dns_ptr_record
  description = "DNS PTR record Outputs"
}