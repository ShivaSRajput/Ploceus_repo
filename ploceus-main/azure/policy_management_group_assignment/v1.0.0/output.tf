output "policy_assignment_id" {
  value = { for k, v in azurerm_management_group_policy_assignment.management_group_policy : k => v.id }
}
