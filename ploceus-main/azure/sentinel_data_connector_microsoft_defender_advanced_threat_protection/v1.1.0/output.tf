#Sentinel Data Connector Microsoft Defender advanced threat protection Outputs
output "sentinel_data_connector_microsoft_defender_advanced_threat_protection_ids" {
  description = "The ID of the Sentinel Data Connector Microsoft Defender advanced threat protection"
  value       = { for k, v in azurerm_sentinel_data_connector_microsoft_defender_advanced_threat_protection.sentinel_data_connector_microsoft_defender_advanced_threat_protection : k => v.id }
}
