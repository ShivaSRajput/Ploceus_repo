#sentinel dataconnector azure advanced threat protection Outputs
output "sentinel_data_connector_azure_advanced_threat_protection_ids" {
  description = "The ID of the Sentinel Data Connector advanced threat protection"
  value       = { for k, v in azurerm_sentinel_data_connector_azure_advanced_threat_protection.sentinel_data_connector_azure_advanced_threat_protection : k => v.id }
}
