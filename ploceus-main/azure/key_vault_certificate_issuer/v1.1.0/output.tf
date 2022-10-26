output "key_vault_cert_id" {
  value = { for k, v in azurerm_key_vault_certificate_issuer.certificate : k => v.id }
}