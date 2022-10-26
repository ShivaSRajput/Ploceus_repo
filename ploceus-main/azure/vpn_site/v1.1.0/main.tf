data "azurerm_virtual_wan" "virtual_wan" {
  for_each            = var.vpn_site_variables
  name                = each.value.virtual_wan_name
  resource_group_name = each.value.resource_group_name

}

resource "azurerm_vpn_site" "vpn_site" {
  for_each            = var.vpn_site_variables
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  virtual_wan_id      = data.azurerm_virtual_wan.virtual_wan[each.key].id
  device_vendor       = each.value.device_vendor
  device_model        = each.value.device_model
  address_cidrs       = each.value.address_cidrs

  dynamic "link" {
    for_each = each.value.links != null ? toset(each.value.links) : []
    content {
      name          = link.value.name
      ip_address    = link.value.ip_address
      provider_name = link.value.provider_name
      speed_in_mbps = link.value.speed_in_mbps
      dynamic "bgp" {
        for_each = link.value.bgp_enabled == true ? toset(link.value.bgp) : []
        content {
          asn             = bgp.value.asn
          peering_address = bgp.value.peering_address
        }
      }
    }
  }
  tags = merge(each.value.tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
  lifecycle { ignore_changes = [tags["Created_Time"]] }

}