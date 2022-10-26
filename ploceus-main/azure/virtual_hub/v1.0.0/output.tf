output "virtual_hub_id" {
  value = { for k, v in azurerm_virtual_hub.vhub : k => v.id }
}