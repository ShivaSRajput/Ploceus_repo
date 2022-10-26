#This Module helps us to create KeyVault with Key

data "azurerm_key_vault" "key_vault_id" {
  for_each            = var.key_vault_key_variables
  name                = each.value.key_vault_name
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_key_vault_key" "key_vault_key" {
  for_each        = var.key_vault_key_variables
  name            = each.value.name
  key_vault_id    = data.azurerm_key_vault.key_vault_id[each.key].id
  key_type        = each.value.key_type
  key_size        = (each.value.key_type == "RSA" || each.value.key_type == "RSA-HSM") ? each.value.key_size : null
  curve           = (each.value.key_type == "EC" || each.value.key_type == "EC-HSM") ? each.value.curve : null
  key_opts        = each.value.key_opts
  not_before_date = each.value.not_before_date == null ? null : each.value.not_before_date
  expiration_date = each.value.expiration_date == null ? null : each.value.expiration_date
  tags            = merge(each.value.key_vault_key_tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
  lifecycle { ignore_changes = [tags["Created_Time"]] }
}
