data "azurerm_resource_group" "resource_group" {
  for_each = var.virtual_hub_variables
  name     = each.value.resource_group_name
}

data "azurerm_virtual_wan" "virtual_wan" {
  for_each            = var.virtual_hub_variables
  name                = each.value.virtual_wan_id
  resource_group_name = each.value.resource_group_name

}

resource "azurerm_virtual_hub" "vhub" {
  for_each            = var.virtual_hub_variables
  name                = each.value.name
  location            = data.azurerm_resource_group.resource_group[each.key].location
  resource_group_name = each.value.resource_group_name
  virtual_wan_id      = data.azurerm_virtual_wan.virtual_wan[each.key].id
  address_prefix      = each.value.virtual_hub_address_prefix
  depends_on = [
    data.azurerm_virtual_wan.virtual_wan
  ]
  tags = merge(each.value.virtual_hub_tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
  lifecycle { ignore_changes = [tags["Created_Time"]] }
}

