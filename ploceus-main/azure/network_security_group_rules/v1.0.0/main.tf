#azurerm_network_security_rule
resource "azurerm_network_security_rule" "azurerm_network_security_rule" {
  for_each                                   = var.network_security_group_rules_variable
  name                                       = each.value.name
  resource_group_name                        = each.value.resource_group_name
  network_security_group_name                = each.value.network_security_group_name
  priority                                   = each.value.priority
  direction                                  = each.value.direction
  access                                     = each.value.access
  protocol                                   = each.value.protocol
  source_port_range                          = each.value.source_port_range == null ? null : each.value.source_port_range
  source_port_ranges                         = each.value.source_port_ranges == null ? null : each.value.source_port_ranges
  destination_port_range                     = each.value.destination_port_range == null ? null : each.value.destination_port_range
  destination_port_ranges                    = each.value.destination_port_ranges == null ? null : each.value.destination_port_ranges
  source_address_prefix                      = each.value.source_address_prefix == null ? null : each.value.source_address_prefix
  source_address_prefixes                    = each.value.source_address_prefixes == null ? null : each.value.source_address_prefixes
  destination_address_prefix                 = each.value.destination_address_prefix == null ? null : each.value.destination_address_prefix
  destination_address_prefixes               = each.value.destination_address_prefixes == null ? null : each.value.destination_address_prefixes
  description                                = each.value.description == null ? null : each.value.description
  source_application_security_group_ids      = each.value.source_application_security_group_ids == null ? null : each.value.source_application_security_group_ids
  destination_application_security_group_ids = each.value.destination_application_security_group_ids == null ? null : each.value.destination_application_security_group_ids
}
