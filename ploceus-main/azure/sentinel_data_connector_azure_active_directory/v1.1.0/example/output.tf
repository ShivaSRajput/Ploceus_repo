#sentinel dataconnector azure advanced threat protection Outputs
output "sentinel_data_connector_azure_active_directory_ids" {
  description = "The ID of the sentinel data connector azure active directory"
  value       = module.sentinel_data_connector_azure_active_directory.sentinel_data_connector_azure_active_directory_ids
}
