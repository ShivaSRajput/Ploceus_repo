#Output WAN id
output "virtual_wan_outputs" {
  value       = { for k, v in azurerm_virtual_wan.vwan : k => v.id }
  description = "Virtual WAN ID"
}
