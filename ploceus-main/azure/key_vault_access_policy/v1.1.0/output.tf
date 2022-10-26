output "key_vault_access_policy_id" {
  value = { for k, v in azurerm_key_vault_access_policy.key_vault_access_policy : k => v.id }
}
