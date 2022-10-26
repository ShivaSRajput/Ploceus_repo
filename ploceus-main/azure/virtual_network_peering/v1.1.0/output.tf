output "virtual_network_peering_source_dest_id" {
  value = { for k, v in azurerm_virtual_network_peering.vnet_peering_source_dest : k => v.id }
}

output "virtual_network_peering_dest_source_id" {
  value = { for k, v in azurerm_virtual_network_peering.vnet_peering_dest_source : k => v.id }
}