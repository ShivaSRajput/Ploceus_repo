output "postgresql_server_id" {
  value = { for k, v in azurerm_postgresql_server.postgresql_server : k => v.id }
}