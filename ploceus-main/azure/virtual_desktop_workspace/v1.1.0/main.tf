# azure virtual desktop workspace
resource "azurerm_virtual_desktop_workspace" "virtual_desktop_workspace" {
  for_each            = var.desktop_workspaces_variables
  name                = each.value.workspace_name
  location            = each.value.location
  resource_group_name = each.value.workspace_resource_group_name

  friendly_name = each.value.friendly_name
  description   = each.value.description
  tags          = merge(each.value.workspace_tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
  lifecycle { ignore_changes = [tags["Created_Time"]] }
}
