output "key_vault_key_id" {
  value = { for k, v in azurerm_key_vault_key.key_vault_key : k => v.id }
}