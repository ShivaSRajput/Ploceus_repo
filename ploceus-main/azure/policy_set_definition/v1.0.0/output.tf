output "policy_set_definition_id" {
  value = { for k, v in azurerm_policy_set_definition.policy_set_definition : k => v.id }
}