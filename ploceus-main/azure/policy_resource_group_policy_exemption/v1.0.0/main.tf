## Data Block is used to fetch the resource group id
data "azurerm_resource_group" "resource_group" {
  for_each = var.resource_group_policy_exemption_variables
  name     = each.value.resource_group_name
}


# Terraform module to create Resource Group policy exemption
resource "azurerm_resource_group_policy_exemption" "resource_group_policy_exemption" {
  for_each                        = var.resource_group_policy_exemption_variables
  name                            = each.value.name
  resource_group_id               = data.azurerm_resource_group.resource_group[each.key].id
  exemption_category              = each.value.exemption_category
  policy_assignment_id            = each.value.policy_assignment_id
  description                     = each.value.description
  display_name                    = each.value.display_name
  expires_on                      = each.value.expires_on
  policy_definition_reference_ids = each.value.policy_definition_reference_ids
  metadata                        = each.value.metadata
}

