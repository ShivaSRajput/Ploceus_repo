# azure virtual desktop workspace

data "azurerm_resources" "appgroup" {
  type     = "Microsoft.DesktopVirtualization/applicationGroups"
  for_each = var.applications
  name     = each.value.app_group
}


resource "azurerm_virtual_desktop_application" "application" {
  for_each                     = var.applications
  name                         = each.value.name
  application_group_id         = data.azurerm_resources.appgroup[each.key].resources[0].id
  friendly_name                = each.value.friendly_name
  description                  = each.value.description
  path                         = each.value.path
  command_line_argument_policy = each.value.command_line_argument_policy
  command_line_arguments       = each.value.command_line_arguments
  show_in_portal               = each.value.show_in_portal
  icon_path                    = each.value.icon_path
  icon_index                   = each.value.icon_index
}