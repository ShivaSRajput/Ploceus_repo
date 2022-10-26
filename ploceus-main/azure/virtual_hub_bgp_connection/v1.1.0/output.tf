#Output Virtual Hub BGP Connection 
output "virtual_hub_bgp_connection_id" {
  value = { for k, v in azurerm_virtual_hub_bgp_connection.virtual_hub_bgp_connection : k => v.id }
}