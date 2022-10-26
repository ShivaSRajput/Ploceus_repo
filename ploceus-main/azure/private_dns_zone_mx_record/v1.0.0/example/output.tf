#Output Private DNS Zone SRV Record
output "Private_DNS_Zone_SRV_Record" {
  value       = module.private_dns_zone_mx_record.private_dns_zone_mx_record
  description = "Private DNS Zone MX record Outputs"
}