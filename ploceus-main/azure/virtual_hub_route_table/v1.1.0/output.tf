#Output Virtual Hub Route Table
output "virtual_hub_route_table_id" {
  value = { for k, v in azurerm_virtual_hub_route_table.virtual_hub_route_table : k => v.id }
}
