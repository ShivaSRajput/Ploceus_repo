
data "azurerm_virtual_network" "virtual_network" {
  for_each            = var.private_dns_zone_virtual_network_links
  name                = each.value.virtual_network_name
  resource_group_name = each.value.resource_group_name
}




#PRIVATE DNS ZONE VIRTUAL NETWORK LINK
resource "azurerm_private_dns_zone_virtual_network_link" "private_dns_zone_virtual_network_link" {
  for_each              = var.private_dns_zone_virtual_network_links
  name                  = each.value.name
  private_dns_zone_name = each.value.private_dns_zone_name
  resource_group_name   = each.value.resource_group_name
  registration_enabled  = each.value.registration_enabled
  tags                  = merge(each.value.tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
    lifecycle { ignore_changes = [tags["Created_Time"]] }
  virtual_network_id    = data.azurerm_virtual_network.virtual_network[each.key].id
}