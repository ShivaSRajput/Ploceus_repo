output "virtual_desktop_host_pool_registration_infos_ids" {
  value       = module.virtual_desktop_host_pool_reg_info.virtual_desktop_host_pool_registration_infos_ids
  description = "windows virtual desktop host pool reg info values"
  sensitive   = true
}
