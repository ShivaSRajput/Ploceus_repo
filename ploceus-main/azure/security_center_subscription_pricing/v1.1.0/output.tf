output "security_center_subscription_pricing_id" {
  value = { for k, v in azurerm_security_center_subscription_pricing.security_center_subscription_pricing : k => v.id }
}
