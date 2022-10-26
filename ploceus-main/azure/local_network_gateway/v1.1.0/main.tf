locals {
  bgp_setting = { for k, v in var.local_network_gateway_variables : k => v if lookup(v, "bgp_settings_enabled", "NULL") != false }
}

#Local Network Gateway
resource "azurerm_local_network_gateway" "local_network_gateway" {
  for_each            = var.local_network_gateway_variables
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  gateway_address     = each.value.gateway_address
  gateway_fqdn        = each.value.gateway_fqdn
  address_space       = each.value.address_space
  dynamic "bgp_settings" {
    for_each = each.value.bgp_settings_enabled == true ? local.bgp_setting[each.key] : []
    content {
      asn                 = bgp_settings.value.asn
      bgp_peering_address = bgp_settings.value.bgp_peering_address
      peer_weight         = bgp_settings.value.peer_weight
    }
  }
  tags = merge(each.value.tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
  lifecycle { ignore_changes = [tags["Created_Time"]] }
}



