output "subscription_policy_exemption_id" {
  description = "subscription policy exemption id"
  value       = { for k, v in module.subscription_policy_exemption.subscription_policy_exemption_id : k => v }
}