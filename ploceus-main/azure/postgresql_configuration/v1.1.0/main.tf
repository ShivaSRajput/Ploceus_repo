resource "azurerm_postgresql_configuration" "postgresql_configuration" {
  for_each            = var.postgresql_configuration_variables
  name                = each.value.postgresql_configuration_name
  resource_group_name = each.value.postgresql_configuration_resource_group_name
  server_name         = each.value.postgresql_configuration_server_name
  value               = each.value.postgresql_configuration_value
}
