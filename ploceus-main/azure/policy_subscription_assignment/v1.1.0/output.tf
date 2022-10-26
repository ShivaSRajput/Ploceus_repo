output "policy_assignment_id" {
  value = { for k, v in azurerm_subscription_policy_assignment.sub_policy : k => v.id }
}