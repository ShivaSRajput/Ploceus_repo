#PRIVATE DNS ZONE SRV RECORD OUTPUTS
output "private_dns_zone_srv_record" {
  value = azurerm_private_dns_srv_record.private_dns_zone_srv_record
  description = "Private DNS Zone SRV record outputs"
}