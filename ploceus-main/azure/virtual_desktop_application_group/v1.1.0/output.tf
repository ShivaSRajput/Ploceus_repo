output "virtual_desktop_application_groups_ids" {
  value       = { for k, v in azurerm_virtual_desktop_application_group.virtual_desktop_application_group : k => v.id }
  description = "Created VDI App Groups Information"
}
