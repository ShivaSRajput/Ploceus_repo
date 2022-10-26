#Output virtual WAN ID
output "Private_DNS_Zone" {
  value       = module.private_dns_zones.private_dns_zones
  #value       = module.private_dns_zones.privatedns
  description = "Private DNS Zone Outputs"
}