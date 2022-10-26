#PRIVATE DNS ZONE VIRTUAL NETWORK LINK OUTPUTS
output "private_dns_zone_virtual_network_link" {
  value       = module.private_dns_zone_virtual_network_link.private_dns_zone_virtual_network_link
  description = "Private DNS Zone TXT record Outputs"
}