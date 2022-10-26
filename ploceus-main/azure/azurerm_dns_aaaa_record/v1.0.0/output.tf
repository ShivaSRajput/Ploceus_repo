
#PUBLIC DNS ZONE aaaa RECORD OUTPUTS
output "public_dns_zone_aaaa_record" {
  value       = azurerm_dns_aaaa_record.public_dns_zone_aaaa_record
  description = "Public DNS Zone aaaa record outputs"
}

#PUBLIC DNS ZONE aaaa ALIAS RECORD OUTPUTS
output "public_dns_zone_aaaa_alias_record" {
  value       = azurerm_dns_aaaa_record.public_dns_zone_aaaa_alias_record
  description = "Public DNS Zone aaaa alias record outputs"
}
