#PUBLIC DNS ZONE A RECORD OUTPUTS
output "public_dns_zone_a_record" {
  value       = module.public_dns_zone_a_record.public_dns_zone_a_record
  description = "Public DNS Zone A record outputs"
}

#PUBLIC DNS ZONE CNAME ALIAS RECORD OUTPUTS
output "public_dns_zone_a_alias_record" {
  value       = module.public_dns_zone_a_record.public_dns_zone_a_alias_record
  description = "Public DNS Zone A alias record outputs"
}
