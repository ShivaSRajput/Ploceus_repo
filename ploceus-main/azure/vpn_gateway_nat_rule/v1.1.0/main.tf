data "azurerm_vpn_gateway" "vpn_gateway" {
  for_each            = var.vpn_gateway_nat_rule_variables
  name                = each.value.vpn_gateway_id
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_vpn_gateway_nat_rule" "vpn_gateway_nat_rule" {
  for_each            = var.vpn_gateway_nat_rule_variables
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  vpn_gateway_id      = data.azurerm_vpn_gateway.vpn_gateway[each.key].id
  ip_configuration_id = each.value.ip_configuration_id
  mode                = each.value.mode
  type                = each.value.type


  external_mapping {
      address_space    = each.value.external_mapping.address_space
      port_range       = each.value.external_mapping.port_range
  }
    internal_mapping {
      address_space    = each.value.internal_mapping.address_space
      port_range       = each.value.external_mapping.port_range
  }
}