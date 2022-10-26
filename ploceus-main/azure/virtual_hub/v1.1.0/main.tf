#Virtual HUB
locals {
  virtual_wan = { for k, v in var.virtual_hub_variables : k => v if(lookup(v, "virtual_wan_name", null) != null) }
}

data "azurerm_resource_group" "resource_group" {
  for_each = var.virtual_hub_variables
  name     = each.value.resource_group_name
}

data "azurerm_virtual_wan" "virtual_wan" {
  for_each            = local.virtual_wan
  name                = each.value.virtual_wan_name
  resource_group_name = each.value.resource_group_name

}

resource "azurerm_virtual_hub" "virtual_hub" {
  for_each            = var.virtual_hub_variables
  name                = each.value.name
  location            = data.azurerm_resource_group.resource_group[each.key].location
  resource_group_name = each.value.resource_group_name
  virtual_wan_id      = each.value.virtual_wan_name == null ? null : data.azurerm_virtual_wan.virtual_wan[each.key].id
  address_prefix      = each.value.address_prefix
  sku                 = each.value.sku
  dynamic "route" {
    for_each = each.value.route != [] ? toset(each.value.route) : []
    content {
      address_prefixes    = route.value.route_address_prefixes    
      next_hop_ip_address = route.value.route_next_hop_ip_address
    }
  }
  tags = merge(each.value.virtual_hub_tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
  lifecycle { ignore_changes = [tags["Created_Time"]] }
  depends_on = [
    data.azurerm_virtual_wan.virtual_wan
  ]
}

