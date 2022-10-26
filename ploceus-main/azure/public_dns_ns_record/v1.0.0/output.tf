#Output DNS Zone NS Record
output "dns_ns_record" {
  value       = azurerm_dns_ns_record.dns_ns_record
  description = "DNS NS record Outputs"
}