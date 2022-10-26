output "security_center_auto_provisioning_id" {
  value = { for k, v in azurerm_security_center_auto_provisioning.security_center_auto_provisioning : k => v.id }
}
