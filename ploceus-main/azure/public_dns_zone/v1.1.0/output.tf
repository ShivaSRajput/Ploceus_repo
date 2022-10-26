output "public_dns_zone_id" {
  value = { for k, v in azurerm_dns_zone.public_dns_zone : k => v.id }
}