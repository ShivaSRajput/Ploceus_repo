# DNS ZONE SRV RECORD OUTPUTS
output "dns_zone_srv_record_id" {
  value = { for k, v in azurerm_dns_srv_record.dns_zone_srv_record : k => v.id }
  description = "Public DNS Zone SRV record id"
}

output "dns_zone_srv_record_fqdn" {
  value = { for k, v in azurerm_dns_srv_record.dns_zone_srv_record : k => v.fqdn }
  description = "Public DNS Zone SRV record fqdn"
}