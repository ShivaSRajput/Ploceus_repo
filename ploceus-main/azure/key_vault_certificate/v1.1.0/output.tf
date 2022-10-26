output "key_vault_certificate_outputs" {
  value = [
    for k, v in var.key_vault_certificate_variables :
    {
      id        = azurerm_key_vault_certificate.key_vault_certificate[k].id
      secret_id = azurerm_key_vault_certificate.key_vault_certificate[k].secret_id
      version   = azurerm_key_vault_certificate.key_vault_certificate[k].version
    }
  ]
  description = "key vault certificate output values"
}