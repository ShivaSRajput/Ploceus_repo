# azure virtual_desktop_host_pool_registration_info

data "azurerm_resources" "host_pool" {
  type     = "Microsoft.DesktopVirtualization/hostpools"
  for_each = var.hostpool_reginfo_variables
  name     = each.value.host_pool_name
}


resource "azurerm_virtual_desktop_host_pool_registration_info" "hostpool_reginfo" {
  for_each        = var.hostpool_reginfo_variables
  hostpool_id     = replace(data.azurerm_resources.host_pool[each.key].resources[0].id, "/hostpools/", "/hostPools/")
  expiration_date = each.value.expiration_time
}
