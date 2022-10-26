locals {
  vnetpeering_dest_source = { for k, v in var.virtual_network_peering_variables : k => v if v.duplex_enabled == true }
}

data "azurerm_virtual_network" "destination_virtual_network_id" {
  provider            = azurerm.dest_vnet_sub
  for_each            = var.virtual_network_peering_variables
  name                = each.value.destination_virtual_network_name
  resource_group_name = each.value.destination_resource_group_name
}

data "azurerm_virtual_network" "source_virtual_network_id" {
  provider            = azurerm.source_vnet_sub
  for_each            = var.virtual_network_peering_variables
  name                = each.value.source_virtual_network_name
  resource_group_name = each.value.source_resource_group_name
}

resource "azurerm_virtual_network_peering" "vnet_peering_source_dest" {
  provider                     = azurerm.source_vnet_sub
  for_each                     = var.virtual_network_peering_variables
  name                         = each.value.vnet_peering_name
  resource_group_name          = each.value.source_resource_group_name
  virtual_network_name         = each.value.source_virtual_network_name
  remote_virtual_network_id    = data.azurerm_virtual_network.destination_virtual_network_id[each.key].id
  allow_virtual_network_access = each.value.allow_virtual_network_access
  allow_forwarded_traffic      = each.value.allow_forwarded_traffic
  allow_gateway_transit        = each.value.allow_gateway_transit
  use_remote_gateways          = each.value.use_remote_gateways
}

resource "azurerm_virtual_network_peering" "vnet_peering_dest_source" {
  provider                     = azurerm.dest_vnet_sub
  for_each                     = local.vnetpeering_dest_source
  name                         = each.value.vnet_peering_name
  resource_group_name          = each.value.destination_resource_group_name
  virtual_network_name         = each.value.destination_virtual_network_name
  remote_virtual_network_id    = data.azurerm_virtual_network.source_virtual_network_id[each.key].id
  allow_virtual_network_access = each.value.allow_virtual_network_access
  allow_forwarded_traffic      = each.value.allow_forwarded_traffic
  allow_gateway_transit        = each.value.allow_gateway_transit
  use_remote_gateways          = each.value.use_remote_gateways
}
