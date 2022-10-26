#sentinel data connector azure active directory Outputs
output "sentinel_data_connector_azure_active_directory_ids" {
  description = "The ID of the sentinel data connector azure active directory"
  value       = { for k, v in azurerm_sentinel_data_connector_azure_active_directory.sentinel_data_connector_azure_active_directory : k => v.id }
}
