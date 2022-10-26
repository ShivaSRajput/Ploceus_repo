#Output PostgreSql_configuration
output "postgresql_configuration_ids" {
  value       = module.postgresql_configuration.postgresql_configuration_ids
  description = "PostgreSql configuration Output"
}
