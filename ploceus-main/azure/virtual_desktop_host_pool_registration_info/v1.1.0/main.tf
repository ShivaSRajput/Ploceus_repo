# azure virtual_desktop_host_pool_registration_info

data "azurerm_resources" "host_pool" {
  type                = "Microsoft.DesktopVirtualization/hostPools"
  for_each            = var.desktop_host_pool_registration_info_variables
  resource_group_name = each.value.host_pool_resource_group_name
  name                = each.value.host_pool_name
}


resource "azurerm_virtual_desktop_host_pool_registration_info" "virtual_desktop_host_pool_registration_info" {
  for_each        = var.desktop_host_pool_registration_info_variables
  hostpool_id     = replace(data.azurerm_resources.host_pool[each.key].resources[0].id, "/hostpools", "/hostPools")
  expiration_date = each.value.expiration_time
}
