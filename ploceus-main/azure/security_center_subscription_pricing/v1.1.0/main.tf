resource "azurerm_security_center_subscription_pricing" "security_center_subscription_pricing" {
  for_each      = var.security_center_subscription_pricing_variables
  tier          = each.value.tier
  resource_type = each.value.resource_type
}
