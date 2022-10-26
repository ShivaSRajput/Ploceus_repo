output "id" {
  description = "The ID of the Backup Policy"
  value       = { for k, v in azurerm_backup_policy_vm.backup_policy_vm : k => v.id }
}
