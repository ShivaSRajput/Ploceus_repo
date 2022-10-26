output "security_center_contact_id" {
  value = { for k, v in azurerm_security_center_contact.security_center_contact : k => v.id }
}
