output "subscription_policy_remediation_id" {
  description = "subscription policy exemption id"
  value       = { for k, v in module.subscription_policy_remediation.subscription_policy_remediation_id : k => v }
}