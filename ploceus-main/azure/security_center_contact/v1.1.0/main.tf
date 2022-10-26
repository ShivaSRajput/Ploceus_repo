resource "azurerm_security_center_contact" "security_center_contact" {
  for_each            = var.security_center_contact_variables
  email               = each.value.email
  phone               = each.value.phone
  alert_notifications = each.value.alert_notifications
  alerts_to_admins    = each.value.alerts_to_admins
}
