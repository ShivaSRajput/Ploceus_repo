#PRIVATE DNS ZONE PTR RECORD OUTPUTS
output "private_dns_zone_ptr_record" {
  value = module.private_dns_zone_ptr_record.private_dns_zone_ptr_record
  description = "Private DNS Zone PTR record outputs"
}