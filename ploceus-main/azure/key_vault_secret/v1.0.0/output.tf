output "key_vault_secret_id" {
  value = { for k, v in azurerm_key_vault_secret.secrets : k => v.id }
}