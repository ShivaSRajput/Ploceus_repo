output "monitor_log_profiles_id" {
  value       = {for k,v in azurerm_monitor_log_profile.monitor_log_profile:k=> v.id}
  description = "monitor log profile information"
}
