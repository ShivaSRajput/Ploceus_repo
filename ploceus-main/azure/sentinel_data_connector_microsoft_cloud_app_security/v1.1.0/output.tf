# Sentinel Data Connector Microsoft cloud app security OUTPUT
output "sentinel_data_connector_microsoft_cloud_app_security_ids" {
  description = "The ID of the Sentinel Data Connector Microsoft cloud app security "
  value       = { for k, v in azurerm_sentinel_data_connector_microsoft_cloud_app_security.sentinel_data_connector_microsoft_cloud_app_security : k => v.id }
}
