#Output DNS NS Record
output "dns_ns_record" {
  value       = module.dns_ns_record.dns_ns_record
  description = "DNS Zone NS record Outputs"
}