#VPN Gateway
data "azurerm_virtual_hub" "virtual_hub" {
  for_each            = var.vpn_gateways_variables
  name                = each.value.virtual_hub_name
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_vpn_gateway" "vpn_gateway" {
  for_each                              = var.vpn_gateways_variables
  name                                  = each.value.name
  location                              = each.value.location
  resource_group_name                   = each.value.resource_group_name
  virtual_hub_id                        = data.azurerm_virtual_hub.virtual_hub[each.key].id
  bgp_route_translation_for_nat_enabled = each.value.bgp_route_translation_for_nat_enabled
  dynamic "bgp_settings" {
      for_each = each.value.bgp_settings_enabled == true ? [1]:[]
      content {
      asn = each.value.bgp_settings.asn
      peer_weight = each.value.bgp_settings.peer_weight
      dynamic "instance_0_bgp_peering_address" {
        for_each= each.value.bgp_settings.instance_0_bgp_peering_address_custom_ips != null ?[1]:[]
        content{
        custom_ips = each.value.bgp_settings.instance_0_bgp_peering_address_custom_ips
      }
      }
      dynamic "instance_1_bgp_peering_address" {
        for_each= each.value.bgp_settings.instance_1_bgp_peering_address_custom_ips != null ?[1]:[]
        content{
        custom_ips = each.value.bgp_settings.instance_1_bgp_peering_address_custom_ips
      }
      }
    }
  }
  routing_preference = each.value.routing_preference
  scale_unit         = each.value.scale_unit
  tags               = merge(each.value.tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
  lifecycle { ignore_changes = [tags["Created_Time"]] }
}