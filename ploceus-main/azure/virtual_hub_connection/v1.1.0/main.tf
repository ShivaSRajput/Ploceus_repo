data "azurerm_virtual_network" "remote_virtual_network_id" {
  provider            = azurerm.vnet_sub
  for_each            = var.virtual_hub_connection_variables
  name                = each.value.vnet_name
  resource_group_name = each.value.vnet_resource_group_name
}

data "azurerm_virtual_hub" "virtual_hub_id" {
  provider            = azurerm.virtual_hub_sub
  for_each            = var.virtual_hub_connection_variables
  name                = each.value.virtual_hub_name
  resource_group_name = each.value.virtual_hub_resource_group_name
}

resource "azurerm_virtual_hub_connection" "virtual_hub_connection" {
  provider                  = azurerm.virtual_hub_sub
  for_each                  = var.virtual_hub_connection_variables
  name                      = each.value.name
  virtual_hub_id            = data.azurerm_virtual_hub.virtual_hub_id[each.key].id
  remote_virtual_network_id = data.azurerm_virtual_network.remote_virtual_network_id[each.key].id
  depends_on                = [data.azurerm_virtual_network.remote_virtual_network_id, data.azurerm_virtual_hub.virtual_hub_id]
}
