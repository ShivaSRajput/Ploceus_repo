data "azurerm_key_vault" "key_vault_id" {
  for_each            = var.key_vault_cert_variables
  name                = each.value.key_vault_name
  resource_group_name = each.value.resource_group_name
}


resource "azurerm_key_vault_certificate_issuer" "certificate" {
  for_each      = var.key_vault_cert_variables
  name          = each.value.name
  org_id        = each.value.org_id
  key_vault_id  = data.azurerm_key_vault.key_vault_id[each.key].id
  provider_name = each.value.ProviderName
  account_id    = each.value.account_id
  password      = each.value.password != null ? each.value.password : null
  admin {
    email_address = each.value.email
    first_name    = each.value.first_name
    last_name     = each.value.last_name
    phone         = each.value.phone
  }
}