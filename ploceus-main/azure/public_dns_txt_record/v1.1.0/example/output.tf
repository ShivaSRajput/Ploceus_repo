#Output Public DNS Zone TXT Record
output "dns_zone_txt_record_id" {
  value       = module.public_dns_txt_record.dns_zone_txt_record_id
  description = "Public DNS Zone TXT record id"
}

#Output Public DNS Zone TXT Record FQDN
output "dns_zone_txt_record_fqdn" {
  value       = module.public_dns_txt_record.dns_zone_txt_record_fqdn
  description = "Public DNS Zone TXT record fqdn"
}