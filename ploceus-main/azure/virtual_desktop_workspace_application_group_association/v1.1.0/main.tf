# azure virtual desktop workspace

data "azurerm_resources" "application_groups" {
  type                = "Microsoft.DesktopVirtualization/applicationGroups"
  for_each            = var.desktop_workspace_application_group_association_variables
  name                = each.value.app_group.app_group_name
  resource_group_name = each.value.app_group.app_group_resource_group_name
}

data "azurerm_resources" "workspaces" {
  type                = "Microsoft.DesktopVirtualization/workspaces"
  for_each            = var.desktop_workspace_application_group_association_variables
  name                = each.value.workspace.workspace_name
  resource_group_name = each.value.workspace.workspace_resource_group_name
}

resource "azurerm_virtual_desktop_workspace_application_group_association" "desktop_workspace_application_group_association" {
  for_each             = var.desktop_workspace_application_group_association_variables
  workspace_id         = data.azurerm_resources.workspaces[each.key].resources[0].id
  application_group_id = replace(data.azurerm_resources.application_groups[each.key].resources[0].id, "/applicationgroups", "/applicationGroups")
}