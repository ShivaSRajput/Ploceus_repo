output "policy_definition_id" {
  value = { for k, v in azurerm_policy_definition.policy : k => v.id }
}