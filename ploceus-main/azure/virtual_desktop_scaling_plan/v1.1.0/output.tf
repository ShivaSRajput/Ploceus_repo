output "desktop_scaling_plans_ids" {
  value       = { for k, v in azurerm_virtual_desktop_scaling_plan.desktop_scaling_plan : k => v.id }
  description = "Created Scaling Plan Information"
}
