#PRIVATE DNS ZONE TXT RECORD OUTPUTS
output "private_dns_zone_txt_record" {
  value = azurerm_private_dns_txt_record.private_dns_zone_txt_record
  description = "Private DNS Zone TXT record outputs"
}