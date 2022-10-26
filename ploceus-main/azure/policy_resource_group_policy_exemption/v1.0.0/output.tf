output "resource_group_policy_exemption_id" {
  description = "Resource Group policy exemption id"
  value       = { for k, v in azurerm_resource_group_policy_exemption.resource_group_policy_exemption : k => v.id }
}