output "azurerm_monitor_private_link_scoped_service" {
  value = { for k, v in azurerm_monitor_private_link_scoped_service.monitor_private_link_scoped_service : k => v.id }
  description = "monitor_private_link_scoped_service output values"
}