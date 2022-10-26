#Output PUBLIC DNS Zone MX Record
output "public_dns_zone_mx_record" {
  value       = module.public_dns_zone_mx_record.public_dns_zone_mx_record_id
  description = "Punlic DNS Zone MX records"
}

output "public_dns_zone_mx_record_fqdn" {
  value       = module.public_dns_zone_mx_record.mx_record_fqdn
  description = "A list of DNS MX Record FQDN"
}
