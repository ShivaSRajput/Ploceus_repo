locals {
  is_user_identity_exists = { for k, v in var.resource_policy_variables : k => v if lookup(v, "is_user_identity_import_needed", false) == true }
}

data "azurerm_user_assigned_identity" "identity_ids" {
  for_each            = local.is_user_identity_exists
  name                = each.value.user_assigned_identity_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_policy_definition" "policy_definition" {
  for_each     = var.resource_policy_variables
  display_name = each.value.policy_definition_name
}

data "azurerm_policy_definition" "non_compliance_policy_definition" {
  for_each     = var.resource_policy_variables
  display_name = each.value.non_compliance_policy_definition_name
}

resource "azurerm_resource_policy_assignment" "resource_policy" {
  for_each             = var.resource_policy_variables
  name                 = each.value.name
  resource_id          = each.value.resource_id
  policy_definition_id = each.value.is_policy_definition_exist == false ? data.azurerm_policy_definition.policy_definition[each.key].id : each.value.policy_definition_id
  parameters           = each.value.parameters
  description          = each.value.description
  display_name         = each.value.display_name
  enforce              = each.value.enforce
  identity {
    type         = each.value.identity.type
    identity_ids = each.value.is_user_identity_required == true ? each.value.is_user_identity_exists == false ? [for s in data.azurerm_user_assigned_identity.identity_ids : s.id] : each.value.identity.identity_ids : null // This is required when type is set to UserAssigned.
  }
  location = each.value.location // The location field must also be specified when identity is specified
  metadata = each.value.metadata
  non_compliance_message {
    content                        = each.value.non_compliance_message.content
    policy_definition_reference_id = each.value.policy_definition_reference_exists == false ? data.azurerm_policy_definition.non_compliance_policy_definition[each.key].id : each.value.non_compliance_message.policy_definition_reference_id
  }
  not_scopes = each.value.not_scopes
}