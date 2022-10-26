output "sentinel_data_connector_threat_intelligence_ids" {
  description = "The ID of the sentinel data connector threat intelligence"
  value       = { for k, v in azurerm_sentinel_data_connector_threat_intelligence.sentinel_data_connector_threat_intelligence : k => v.id }
}
