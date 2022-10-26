#DISK ENCRYPTION SET
data "azurerm_key_vault" "key_vault_id" {
  for_each            = var.disk_encryption_set_variables
  name                = each.value.key_vault_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault_key" "key_vault_key" {
  for_each     = var.disk_encryption_set_variables
  name         = each.value.key_vault_key_name
  key_vault_id = data.azurerm_key_vault.key_vault_id[each.key].id
}

data "azurerm_client_config" "current" {
}

resource "azurerm_disk_encryption_set" "disk_encryption_set" {
  for_each                  = var.disk_encryption_set_variables
  name                      = each.value.name
  location                  = each.value.location
  resource_group_name       = each.value.resource_group_name
  key_vault_key_id          = data.azurerm_key_vault_key.key_vault_key[each.key].id
  auto_key_rotation_enabled = each.value.auto_key_rotation_enabled == null ? false : each.value.auto_key_rotation_enabled
  encryption_type           = each.value.encryption_type == null ? "EncryptionAtRestWithCustomerKey" : each.value.encryption_type
  identity {
    type = each.value.identity_type //Currently only "SystemAssigned" is supported
  }
  tags = merge(each.value.disk_encryption_set_tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
  lifecycle { ignore_changes = [tags["Created_Time"]] }
}

resource "azurerm_key_vault_access_policy" "key_vault_access_policy" {
  for_each     = var.disk_encryption_set_variables
  key_vault_id = data.azurerm_key_vault.key_vault_id[each.key].id
  tenant_id    = resource.azurerm_disk_encryption_set.disk_encryption_set[each.key].identity[0].tenant_id
  object_id    = resource.azurerm_disk_encryption_set.disk_encryption_set[each.key].identity[0].principal_id
  key_permissions = [
    "Get",
    "WrapKey",
    "UnwrapKey"
  ]
}