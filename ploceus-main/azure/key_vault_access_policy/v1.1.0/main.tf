#This module will set the access policy for the dis encryption set to the asigned key vault
locals {
  group_context = { for k, v in var.key_vault_access_policy_variables : k => v if(lookup(v, "key_vault_access_resource_type", false) == "Group") }
}
locals {
  user_context = { for k, v in var.key_vault_access_policy_variables : k => v if(lookup(v, "key_vault_access_resource_type", false) == "User") }
}
locals {
  spn_context = { for k, v in var.key_vault_access_policy_variables : k => v if(lookup(v, "key_vault_access_resource_type", false) == "SPN") }
}

locals {
  app_context = { for k, v in var.key_vault_access_policy_variables : k => v if(lookup(v, "key_vault_access_resource_type", false) == "Application") }
}

data "azurerm_client_config" "current" {
}

data "azurerm_key_vault" "key_vault_id" {
  for_each            = var.key_vault_access_policy_variables
  name                = each.value.key_vault_name
  resource_group_name = each.value.key_vault_resource_group_name
}

data "azuread_user" "user_context" {
  for_each            = local.user_context
  user_principal_name = each.value.key_vault_access_resource_name
}

data "azuread_group" "group_context" {
  for_each     = local.group_context
  display_name = each.value.key_vault_access_resource_name
}

data "azuread_service_principal" "spn_context" {
  for_each     = local.spn_context
  display_name = each.value.key_vault_access_resource_name
}

data "azuread_application" "app_context" {
  for_each     = local.app_context
  display_name = each.value.key_vault_access_resource_name
}


resource "azurerm_key_vault_access_policy" "key_vault_access_policy" {
  for_each                = var.key_vault_access_policy_variables
  key_vault_id            = data.azurerm_key_vault.key_vault_id[each.key].id
  tenant_id               = data.azurerm_client_config.current.tenant_id
  object_id               = each.value.key_vault_access_resource_type == "Application" ? data.azuread_application.app_context[each.key].object_id : (each.value.key_vault_access_resource_type == "Group" ? data.azuread_group.group_context[each.key].object_id : (each.value.key_vault_access_resource_type == "User" ? data.azuread_user.user_context[each.key].object_id : data.azuread_service_principal.spn_context[each.key].object_id))
  application_id          = each.value.key_vault_access_resource_type == "Application" ? data.azuread_application.app_context[each.key].application_id : null
  key_permissions         = each.value.key_vault_access_policy_key_permissions
  secret_permissions      = each.value.key_vault_access_policy_secret_permissions
  storage_permissions     = each.value.key_vault_access_policy_storage_permissions
  certificate_permissions = each.value.key_vault_access_policy_certificate_permissions
}





