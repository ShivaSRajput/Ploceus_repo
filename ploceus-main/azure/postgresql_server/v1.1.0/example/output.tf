#Output PostgreSql_Server
output "postgresql_server_id" {
  value       = module.postgresql_server.postgresql_server_id
  description = "PostgreSql Server Output"
}