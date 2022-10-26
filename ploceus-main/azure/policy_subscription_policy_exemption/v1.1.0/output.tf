output "subscription_policy_exemption_id" {
  description = "Subscription policy exemption id"
  value       = { for k, v in azurerm_subscription_policy_exemption.subscription_policy_exemption : k => v.id }
}