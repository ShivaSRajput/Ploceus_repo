output "postgresql_configuration_ids" {
  value = { for k, v in azurerm_postgresql_configuration.postgresql_configuration : k => v.id }
}
