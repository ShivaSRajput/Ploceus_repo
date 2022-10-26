# sentinel data connector AWS cloud trail OUTPUTs
output "sentinel_data_connector_aws_cloud_trail_ids" {
  description = "The ID of the Sentinel Data Connector AWS cloud trail "
  value       = { for k, v in azurerm_sentinel_data_connector_aws_cloud_trail.sentinel_data_connector_aws_cloud_trail : k => v.id }
}
