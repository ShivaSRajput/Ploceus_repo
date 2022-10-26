locals {
    random_password = {for k,v in var.key_vault_secret_variables: k => v if v.value == ""}
}

data "azurerm_key_vault" "key_vault_id" {
  for_each            = var.key_vault_secret_variables
  name                = each.value.key_vault_name
  resource_group_name = each.value.resource_group_name
}



resource "random_password" "passwd" {
  for_each    = local.random_password
  length      = each.value.length
  min_upper   = each.value.min_upper
  min_lower   = each.value.min_lower
  min_numeric = each.value.min_numeric
  min_special = each.value.min_special

  keepers = {
    name = each.key
  }
}

resource "azurerm_key_vault_secret" "secrets" {
  for_each     = var.key_vault_secret_variables
  name         = each.value.name
  value        = each.value.value != "" ? each.value.value : random_password.passwd[each.key].result
  key_vault_id = data.azurerm_key_vault.key_vault_id[each.key].id

  tags            = merge(each.value.tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
  lifecycle { ignore_changes = [tags["Created_Time"]] }
} 
