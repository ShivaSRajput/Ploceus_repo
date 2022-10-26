#Output Public DNS Zone SRV Record ID
output "dns_zone_srv_record_id" {
  value       = module.public_dns_srv_record.dns_zone_srv_record_id
  description = "Public DNS Zone SRV record id"
}

#Output Public DNS Zone SRV Record FQDN
output "dns_zone_srv_record_fqdn" {
  value       = module.public_dns_srv_record.dns_zone_srv_record_fqdn
  description = "Public DNS Zone SRV record fqdn"
}