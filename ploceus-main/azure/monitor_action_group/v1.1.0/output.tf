output "action_group_id" {
  value       = {for k,v in azurerm_monitor_action_group.monitor_action_group:k=>v.id}
  description = "Output for Monitor Action Groups"
}