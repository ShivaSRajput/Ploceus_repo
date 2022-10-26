# Terraform module to create subscription policy Remediation

resource "azurerm_subscription_policy_remediation" "subscription_policy_remediation" {

  for_each                = var.subscription_policy_remediation_variables
  name                    = each.value.subscription_policy_remediation_name
  subscription_id         = "/subscriptions/${each.value.subscription_policy_remediation_subscription_value}"
  policy_assignment_id    = each.value.subscription_policy_remediation_policy_assignment_id
  policy_definition_id    = each.value.subscription_policy_remediation_policy_definition_id
  location_filters        = each.value.subscription_policy_remediation_location_filters
  resource_discovery_mode = each.value.subscription_policy_remediation_resource_discovery_mode
}