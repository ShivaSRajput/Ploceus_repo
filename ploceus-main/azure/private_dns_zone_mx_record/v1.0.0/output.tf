#Output Private DNS Zone MX Record
output "private_dns_zone_mx_record" {
  value       = azurerm_private_dns_mx_record.private_dns_zone_mx_record
  description = "Private DNS Zone MX record Outputs"
}