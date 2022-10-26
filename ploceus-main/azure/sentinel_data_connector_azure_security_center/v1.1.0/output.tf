output "sentinel_data_connector_azure_security_center_ids" {
  description = "The ID of the sentinel data connector azure security center"
  value       = { for k, v in azurerm_sentinel_data_connector_azure_security_center.sentinel_data_connector_azure_security_center: k => v.id }
}