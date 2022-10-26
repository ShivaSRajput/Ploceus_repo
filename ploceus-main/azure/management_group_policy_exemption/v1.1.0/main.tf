# The data block fetches the management group id

data "azurerm_management_group" "management_group_id" {
  for_each     = var.management_group_policy_exemption_variables
  display_name = each.value.management_group_policy_exemption_management_group_display_name
}

# Terraform module to create Management group policy exemption

resource "azurerm_management_group_policy_exemption" "management_group_policy_exemption" {

  for_each                        = var.management_group_policy_exemption_variables
  name                            = each.value.management_group_policy_exemption_name
  management_group_id             = data.azurerm_management_group.management_group_id[each.key].id
  exemption_category              = each.value.management_group_policy_exemption_category
  policy_assignment_id            = each.value.management_group_policy_exemption_policy_assignment_id
  description                     = each.value.management_group_policy_exemption_description
  display_name                    = each.value.management_group_policy_exemption_display_name
  expires_on                      = each.value.management_group_policy_exemption_expires_on
  policy_definition_reference_ids = each.value.management_group_policy_exemption_policy_definition_reference_ids
  metadata                        = each.value.management_group_policy_exemption_metadata
}
