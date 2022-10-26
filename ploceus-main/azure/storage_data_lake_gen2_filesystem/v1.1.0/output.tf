output "storage_data_lake_gen2_filesystem" {
  value       = azurerm_storage_data_lake_gen2_filesystem.storage_data_lake_gen2_filesystem
  description = "Data lake gen2 filesystem id"
}

output "storage_account_id" {
  value       = data.azurerm_storage_account.storage_account
}