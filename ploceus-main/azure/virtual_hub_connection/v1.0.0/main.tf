data "azurerm_virtual_network" "vnet_id" {
  for_each            = var.virtual_hub_connection_variables
  name                = each.value.vnet_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_virtual_hub" "virtual_hub" {
  for_each            = var.virtual_hub_connection_variables
  name                = each.value.vnet_hub_name
  resource_group_name = each.value.resource_group_name

}

resource "azurerm_virtual_hub_connection" "virtual_hub_connection" {
  for_each                  = var.virtual_hub_connection_variables
  name                      = each.value.name
  virtual_hub_id            = data.azurerm_virtual_hub.virtual_hub[each.key].id
  remote_virtual_network_id = data.azurerm_virtual_network.vnet_id[each.key].id
  depends_on                = [data.azurerm_virtual_network.vnet_id, data.azurerm_virtual_hub.virtual_hub]
}
