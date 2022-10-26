resource "azurerm_security_center_setting" "security_center_setting" {
  for_each     = var.security_center_setting_variables
  setting_name = each.value.setting_name
  enabled      = each.value.enabled
}
