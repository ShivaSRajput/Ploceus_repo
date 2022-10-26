# sentinel data connector AWS s3 OUTPUTs
output "sentinel_data_connector_aws_s3_ids" {
  description = "The ID of the Sentinel Data Connector AWS s3"
  value       = module.sentinel_data_connector_aws_s3.sentinel_data_connector_aws_s3_ids
}
