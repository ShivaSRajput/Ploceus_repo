#Output Private DNS Zone SRV Record
output "Private_DNS_Zone_SRV_Record" {
  value       = module.private_dns_zone_srv_record.private_dns_zone_srv_record
  description = "Private DNS Zone SRV record Outputs"
}