# DNS ZONE SRV RECORD OUTPUTS
output "dns_zone_txt_record_id" {
  value = { for k, v in azurerm_dns_txt_record.dns_zone_txt_record : k => v.id }
  description = "Public DNS Zone TXT record id"
}

output "dns_zone_txt_record_fqdn" {
  value = { for k, v in azurerm_dns_txt_record.dns_zone_txt_record : k => v.fqdn }
  description = "Public DNS Zone TXT record fqdn"
}