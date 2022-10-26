locals {
  is_user_identity_exists = { for k, v in var.subscription_policy_variables : k => v if lookup(v, "is_user_identity_import_needed", false) == true }
  non_compliance_policy_definition = {for k,v in var.subscription_policy_variables: k => v if v.non_compliance_message_required == true && v.non_compliance_policy_definition_is_set == false}
  non_compliance_policy_set_definition = {for k,v in var.subscription_policy_variables: k => v if v.non_compliance_message_required == true && v.non_compliance_policy_definition_is_set == true}
  policy_definition = {for k,v in var.subscription_policy_variables: k=>v if lookup(v,"is_policy_definition_is_set",false) == false}
  policy_set_definition = {for k,v in var.subscription_policy_variables: k=>v if lookup(v,"is_policy_definition_is_set",false) == true}
}

data "azurerm_subscription" "current" {
}

data "azurerm_user_assigned_identity" "identity_ids" {
  for_each            = local.is_user_identity_exists
  name                = each.value.user_assigned_identity_name
  resource_group_name = each.value.resource_group_name
}
data "azurerm_policy_set_definition" "policy_set_definition" {
  for_each     = local.policy_set_definition
  display_name = each.value.policy_definition_name
}

data "azurerm_policy_definition" "policy_definition" {
  for_each     = local.policy_definition
  display_name = each.value.policy_definition_name
}

data "azurerm_policy_definition" "non_compliance_policy_definition" {
  for_each     = local.non_compliance_policy_definition
  display_name = each.value.non_compliance_message.non_compliance_policy_definition_name
}

data "azurerm_policy_set_definition" "non_compliance_policy_set_definition" {
  for_each     = local.non_compliance_policy_set_definition
  display_name = each.value.non_compliance_message.non_compliance_policy_definition_name
}

resource "azurerm_subscription_policy_assignment" "sub_policy" {
  for_each             = var.subscription_policy_variables
  name                 = each.value.name
  policy_definition_id = each.value.is_policy_definition_is_set == false ? data.azurerm_policy_definition.policy_definition[each.key].id : data.azurerm_policy_set_definition.policy_set_definition[each.key].id
  subscription_id      = data.azurerm_subscription.current.id
  parameters           = each.value.parameters
  description          = each.value.description
  display_name         = each.value.display_name
  enforce              = each.value.enforce
  dynamic "identity" {
    for_each = each.value.is_identity_required == false ? toset([]) : toset([1])
  content {
    type         = each.value.identity_type
    identity_ids = each.value.is_user_identity_required == true ? each.value.is_user_identity_exists == false ? [for s in data.azurerm_user_assigned_identity.identity_ids : s.id] : each.value.identity_ids : null // This is required when type is set to UserAssigned.
  }
  }
  location = each.value.location // The location field must also be specified when identity is specified
  metadata = each.value.metadata
  dynamic "non_compliance_message" {
    for_each = each.value.non_compliance_message_required == true ? each.value.non_compliance_message : {}
    content {
    content                        = non_compliance_message.value.non_compliance_message.content
    policy_definition_reference_id = non_compliance_message.value.non_compliance_policy_definition_is_set == false ? data.azurerm_policy_definition.non_compliance_policy_definition[each.key].id : data.azurerm_policy_set_definition.non_compliance_policy_set_definition[each.key].id
  }
  }
  not_scopes = each.value.not_scopes
}
