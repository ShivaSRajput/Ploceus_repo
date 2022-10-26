#Output Private DNS Zone TXT Record
output "Private_DNS_Zone_TXT_Record" {
  value       = module.private_dns_zone_txt_record.private_dns_zone_txt_record
  description = "Private DNS Zone TXT record Outputs"
}