output "resource_group_policy_exemption_id" {
  description = "Resource Group policy exemption id"
  value       = { for k, v in module.resource_group_policy_exemption.resource_group_policy_exemption_id : k => v }
}