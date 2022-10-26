#Output Virtual Hub IP
output "virtual_hub_ip_id" {
  value = { for k, v in azurerm_virtual_hub_ip.virtual_hub_ip : k => v.id }
}