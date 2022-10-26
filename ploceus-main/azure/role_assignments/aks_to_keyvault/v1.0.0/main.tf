data "azurerm_key_vault" "key_vault" {
  for_each            = var.aks_keyvault_role_assignment_variables
  name                = each.value.key_vault_name
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_role_assignment" "aks_to_keyvault_role_assignment" {
  for_each             = var.aks_keyvault_role_assignment_variables
  role_definition_name = each.value.role_definition_name
  scope                = data.azurerm_key_vault.key_vault[each.key].id
  principal_id         = var.aks_principal_id
}
