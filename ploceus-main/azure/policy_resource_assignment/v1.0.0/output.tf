output "policy_assignment_id" {
  value = { for k, v in azurerm_resource_policy_assignment.resource_policy : k => v.id }
}