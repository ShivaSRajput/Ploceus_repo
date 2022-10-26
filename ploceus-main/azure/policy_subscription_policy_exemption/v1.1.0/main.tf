# Terraform module to create subscription policy exemption

resource "azurerm_subscription_policy_exemption" "subscription_policy_exemption" {

  for_each                        = var.subscription_policy_exemption_variables
  name                            = each.value.subscription_policy_exemption_name
  subscription_id                 = "/subscriptions/${each.value.subscription_policy_exemption_subscription_value}"
  exemption_category              = each.value.subscription_policy_exemption_category
  policy_assignment_id            = each.value.subscription_policy_exemption_policy_assignment_id
  description                     = each.value.subscription_policy_exemption_description
  display_name                    = each.value.subscription_policy_exemption_display_name
  expires_on                      = each.value.subscription_policy_exemption_expires_on
  policy_definition_reference_ids = each.value.subscription_policy_exemption_policy_definition_reference_ids
  metadata                        = each.value.subscription_policy_exemption_metadata


}