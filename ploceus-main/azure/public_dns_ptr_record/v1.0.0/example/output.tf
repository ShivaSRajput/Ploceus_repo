#Output DNS PTR Record
output "dns_ptr_record"{
  value       = module.dns_ptr_record.dns_ptr_record
  description = "DNS Zone PTR record Outputs"
}