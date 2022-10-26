## Data Block is used to fetch the resource id

data "azurerm_resources" "resources" {
  for_each = var.resource_policy_exemption_variables
  name     = each.value.resource_policy_exemption_resource_name

}


# Terraform module to create Resource policy exemption

resource "azurerm_resource_policy_exemption" "resource_policy_exemption" {

  for_each                        = var.resource_policy_exemption_variables
  name                            = each.value.resource_policy_exemption_name
  resource_id                     = data.azurerm_resources.resources[each.key].resources[0].id
  exemption_category              = each.value.resource_policy_exemption_category
  policy_assignment_id            = each.value.resource_policy_exemption_policy_assignment_id
  description                     = each.value.resource_policy_exemption_description
  display_name                    = each.value.resource_policy_exemption_display_name
  expires_on                      = each.value.resource_policy_exemption_expires_on
  policy_definition_reference_ids = each.value.resource_policy_exemption_policy_definition_reference_ids
  metadata                        = each.value.resource_policy_exemption_metadata
}

