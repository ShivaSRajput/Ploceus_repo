# Output Virtual Hub 
output "virtual_hub_id" {
  value = { for k, v in azurerm_virtual_hub.virtual_hub : k => v.id }
}