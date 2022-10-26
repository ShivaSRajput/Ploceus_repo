  output "container_registry_id" {
  value = { for k, v in azurerm_container_registry.container_registry : k => v.id }
}
