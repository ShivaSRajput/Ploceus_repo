locals {
  management_group      = { for k, v in var.custom_policy_definition_variable : k => v if v["custom_policy"]["management_group_id"] != null }
}

data "azurerm_management_group" "management_group_id" {
  for_each = local.management_group
  display_name     = each.value.custom_policy["management_group_id"]
}

resource "azurerm_policy_definition" "policy" {
  for_each =  var.custom_policy_definition_variable
  name                = each.value.name
  policy_type         = "Custom"
  mode                = each.value.custom_policy.mode
  display_name        = each.value.custom_policy.display_name
  description         = each.value.description
  management_group_id = each.value.custom_policy["management_group_id"] != null ? data.azurerm_management_group.management_group_id[each.key].id : null

  metadata    = each.value.custom_policy.metadata
  policy_rule = each.value.custom_policy.policy_rule
  parameters  = each.value.custom_policy.parameters

  lifecycle {
    # Ignore metadata changes as Azure adds additional metadata module does not handle
    ignore_changes = [
      metadata,
    ]
  }
}


