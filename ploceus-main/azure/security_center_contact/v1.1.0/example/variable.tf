variable "security_center_contact_variables" {
  type = map(object({
    email               = string
    phone               = string
    alert_notifications = bool
    alerts_to_admins    = bool
  }))
}
