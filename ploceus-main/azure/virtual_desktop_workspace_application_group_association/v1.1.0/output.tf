output "desktop_workspace_application_group_association_ids" {
  value       = { for k, v in azurerm_virtual_desktop_workspace_application_group_association.desktop_workspace_application_group_association : k => v.id }
  description = "Created VDI App Groups and Workspace Association Information"
}
