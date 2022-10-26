output "security_center_setting_id" {
  value = { for k, v in azurerm_security_center_setting.security_center_setting : k => v.id }
}
