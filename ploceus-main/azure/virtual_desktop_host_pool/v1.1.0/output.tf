output "virtual_desktop_host_pool_pooled_ids" {
  value       = { for k, v in azurerm_virtual_desktop_host_pool.virtual_desktop_host_pool_pooled : k => v.id }
  description = "Created hostpool pooled Information"
}

output "virtual_desktop_host_pool_personal_ids" {
  value       = { for k, v in azurerm_virtual_desktop_host_pool.virtual_desktop_host_pool_personal : k => v.id }
  description = "Created hostpool personal Information"
}

