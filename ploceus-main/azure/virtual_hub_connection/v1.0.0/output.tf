output "virtual_hub_connection_id" {
  value = { for k, v in azurerm_virtual_hub_connection.virtual_hub_connection : k => v.id }
}