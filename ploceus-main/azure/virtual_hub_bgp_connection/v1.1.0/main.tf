#Virtual Hub BGP Connection
data "azurerm_virtual_hub" "virtual_hub" {
  for_each            = var.virtual_hub_bgp_connection_variables
  name                = each.value.virtual_hub_name
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_virtual_hub_bgp_connection" "virtual_hub_bgp_connection" {
  for_each       = var.virtual_hub_bgp_connection_variables
  name           = each.value.name
  virtual_hub_id = data.azurerm_virtual_hub.virtual_hub[each.key].id
  peer_asn       = each.value.peer_asn
  peer_ip        = each.value.peer_ip
}


