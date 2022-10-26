#PRIVATE DNS ZONE A RECORD OUTPUTS
output "private_dns_zone_a_record" {
  value       = module.private_dns_zone_a_record.private_dns_zone_a_record
  description = "Private DNS Zone A record outputs"
}