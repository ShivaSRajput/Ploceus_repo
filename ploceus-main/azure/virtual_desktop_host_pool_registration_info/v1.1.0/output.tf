output "virtual_desktop_host_pool_registration_infos_ids" {
  value       = { for k, v in azurerm_virtual_desktop_host_pool_registration_info.virtual_desktop_host_pool_registration_info : k => v.id }
  description = "Created Registration Information"
  sensitive   = true
}
