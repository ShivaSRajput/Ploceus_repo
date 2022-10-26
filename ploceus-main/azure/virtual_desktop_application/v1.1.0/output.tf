output "virtual_desktop_applications_ids" {
  value       = { for k, v in azurerm_virtual_desktop_application.virtual_desktop_application : k => v.id }
  description = "Created azurerm virtual desktop application Information"
}
