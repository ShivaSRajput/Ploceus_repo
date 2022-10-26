#This module will set the access policy for the dis encryption set to the asigned key vault

data "azurerm_key_vault" "keyvault_id" {
  for_each            = var.key_vault_access_policy_variables
  name                = each.value.key_vault_name
  resource_group_name = each.value.resource_group_name
}

locals {
  kv_set = { for k, v in var.key_vault_access_policy_variables : k => v if(lookup(v, "disk_encryption_set_key", false) == var.disk_encryption_set_key) }
}

resource "azurerm_key_vault_access_policy" "key_vault_access_policy" {
  for_each            = local.kv_set
  key_vault_id        = data.azurerm_key_vault.keyvault_id[each.key].id
  tenant_id           = var.tenant_id
  object_id           = var.object_id
  key_permissions     = each.value.key_permissions
  secret_permissions  = each.value.secret_permissions
  storage_permissions = each.value.storage_permissions
}





