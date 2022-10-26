#Route Table
resource "azurerm_route" "route" {
  for_each               = var.route_variables
  name                   = each.value.name
  resource_group_name    = each.value.resource_group_name
  route_table_name       = each.value.route_table_name
  address_prefix         = each.value.address_prefix
  next_hop_type          = each.value.next_hop_type
  next_hop_in_ip_address = each.value.next_hop_type == "VirtualAppliance" ? each.value.next_hop_in_ip_address : null
}