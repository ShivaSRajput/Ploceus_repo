#Storage account outputs
output "storage_account_outputs" {
  value = module.storage_account.storage_account_outputs
}

#Storage Container outputs
output "storage_container" {
  value       = module.storage_container
  description = "Storage Container outputs"
}