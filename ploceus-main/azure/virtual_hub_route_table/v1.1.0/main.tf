#Virtual Hub Route Table
data "azurerm_virtual_hub" "virtual_hub" {
  for_each            = var.virtual_hub_route_table_variables
  name                = each.value.virtual_hub_name
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_virtual_hub_route_table" "virtual_hub_route_table" {
  for_each       = var.virtual_hub_route_table_variables
  name           = each.value.name
  virtual_hub_id = data.azurerm_virtual_hub.virtual_hub[each.key].id
  labels         = each.value.labels
  dynamic "route" {
    for_each = each.value.route != null ? toset(each.value.route) : []
    content {
      name              = route.value.name
      destinations_type = route.value.destinations_type
      destinations      = route.value.destinations
      next_hop_type     = route.value.next_hop_type
      next_hop          = "/subscriptions/${route.value.next_hop_subscription}/resourceGroups/${route.value.next_hop_resource_group}/providers/Microsoft.Network/virtualHubs/${route.value.next_hop_virtual_hub}/hubVirtualNetworkConnections/${route.value.next_hop_name}"
    }
  }
  depends_on = [
    data.azurerm_virtual_hub.virtual_hub
  ]
}
