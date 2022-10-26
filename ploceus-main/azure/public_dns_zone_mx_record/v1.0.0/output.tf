#Output PUBLIC DNS Zone MX Record ID
output "public_dns_zone_mx_record_id" {
  value       = azurerm_dns_mx_record.public_dns_zone_mx_record
  description = "Public DNS Zone MX record Ids"
}


output "mx_record_fqdn" {
  value = { for k, v in  azurerm_dns_mx_record.public_dns_zone_mx_record : k => v.fqdn }
  description = "A list of DNS MX Record FQDN"
}



