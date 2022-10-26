#PUBLIC DNS ZONE CNAME RECORD OUTPUTS
output "public_dns_zone_cname_record" {
  value       = module.public_dns_zone_cname_record.public_dns_zone_cname_record
  description = "Public DNS Zone CNAME record outputs"
}

#PUBLIC DNS ZONE CNAME ALIAS RECORD OUTPUTS
output "public_dns_zone_cname_alias_record" {
  value       = module.public_dns_zone_cname_record.public_dns_zone_cname_alias_record
  description = "Public DNS Zone CNAME alias record outputs"
}