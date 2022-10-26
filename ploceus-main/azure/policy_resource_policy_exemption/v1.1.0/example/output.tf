output "resource_policy_exemption_id" {
  description = "Resource policy exemption id"
  value       = { for k, v in module.resource_policy_exemption.resource_policy_exemption_id : k => v }
}