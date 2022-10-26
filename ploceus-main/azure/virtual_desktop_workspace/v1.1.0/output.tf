output "desktop_workspaces_ids" {
  value       = { for k, v in azurerm_virtual_desktop_workspace.virtual_desktop_workspace : k => v.id }
  description = "Created WorkSpace Information"
}
