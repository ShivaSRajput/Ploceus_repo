#Output Public DNS Zone caa Record
output "public_dns_zone_caa_record" {
  value       = azurerm_dns_caa_record.public_dns_zone_caa_record
  description = "Public DNS Zone caa record Outputs"
}