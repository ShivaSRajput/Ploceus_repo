#PRIVATE DNS ZONE AAAA RECORD OUTPUTS
output "private_dns_zone_aaaa_record" {
  value       = module.private_dns_zone_aaaa_record.private_dns_zone_aaaa_record
  description = "Private DNS Zone AAAA record outputs"
}