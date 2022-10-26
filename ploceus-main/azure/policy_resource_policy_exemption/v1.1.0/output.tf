output "resource_policy_exemption_id" {
  description = "Resource policy exemption id"
  value       = { for k, v in azurerm_resource_policy_exemption.resource_policy_exemption : k => v.id }
}