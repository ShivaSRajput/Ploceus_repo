# sentinel data connector office 365 OUTPUTs
output "sentinel_data_connector_office_365_ids" {
  description = "The ID of the Sentinel Data Connector office 365 "
  value       = { for k, v in azurerm_sentinel_data_connector_office_365.sentinel_data_connector_office_365 : k => v.id }
}
