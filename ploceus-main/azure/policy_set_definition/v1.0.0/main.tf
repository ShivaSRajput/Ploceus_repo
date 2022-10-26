data "azurerm_management_group" "mng_grp" {
  for_each     = var.policy_set_definition_variable
  display_name = each.value.management_group_name
}


resource "azurerm_policy_set_definition" "policy_set_definition" {
  for_each            = var.policy_set_definition_variable
  name                = each.value.name
  policy_type         = each.value.policy_type
  display_name        = each.value.display_name
  parameters          = each.value.parameters
  description         = each.value.description
  metadata            = each.value.metadata
  management_group_id = data.azurerm_management_group.mng_grp[each.key].id
  dynamic "policy_definition_reference" {
    for_each = each.value.policy_definition_reference
    content {
      policy_definition_id = policy_definition_reference.value.policy_definition_id
      parameter_values     = policy_definition_reference.value.parameter_values
    }
  }
  dynamic "policy_definition_group" {
    for_each = toset(each.value.policy_definition_group)
    content {
      name = policy_definition_group.value.name
    }
  }
}
