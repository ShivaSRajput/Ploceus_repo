#PRIVATE DNS ZONE CNAME RECORD OUTPUTS
output "private_dns_zone_cname_record" {
  value       = module.private_dns_zone_cname_record.private_dns_zone_cname_record
  description = "Private DNS Zone CNAME record outputs"
}