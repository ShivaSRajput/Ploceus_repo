
data "azurerm_resources" "host_pools" {
  type                = "Microsoft.DesktopVirtualization/hostPools"
  for_each            = var.desktop_application_group_variables
  resource_group_name = each.value.host_pool.host_pool_resource_group_name
  name                = each.value.host_pool.host_pool_name
}


resource "azurerm_virtual_desktop_application_group" "virtual_desktop_application_group" {

  for_each = var.desktop_application_group_variables

  name                = each.value.app_group_name
  location            = data.azurerm_resources.host_pools[each.key].resources[0].location
  resource_group_name = each.value.app_group_resource_group_name

  type                         = each.value.type
  host_pool_id                 = replace(data.azurerm_resources.host_pools[each.key].resources[0].id, "/hostpools", "/hostPools")
  friendly_name                = each.value.friendly_name
  description                  = each.value.description
  default_desktop_display_name = each.value.default_desktop_display_name
  tags                         = merge(each.value.appgroup_tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
  lifecycle { ignore_changes = [tags["Created_Time"]] }
}
