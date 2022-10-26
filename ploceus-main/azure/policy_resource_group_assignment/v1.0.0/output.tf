output "policy_assignment_id" {
  value = { for k, v in azurerm_resource_group_policy_assignment.rg_policy : k => v.id }
}