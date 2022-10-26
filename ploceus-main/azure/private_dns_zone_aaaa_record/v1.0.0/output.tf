#PRIVATE DNS ZONE AAAA RECORD OUTPUTS
output "private_dns_zone_aaaa_record" {
  value = azurerm_private_dns_aaaa_record.private_dns_zone_aaaa_record
  description = "Private DNS Zone AAAA record outputs"
}