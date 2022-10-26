output "subscription_policy_remediation_id" {
  description = "subscription policy remediation id"
  value       = { for k, v in azurerm_subscription_policy_remediation.subscription_policy_remediation : k => v.id }
}