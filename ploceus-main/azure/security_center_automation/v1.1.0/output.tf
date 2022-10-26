output "security_center_automation_ids" {
  description = "security centre automation outputs"
  value = [
    for k, v in azurerm_security_center_automation.security_centre_automation :
    {
      id = v.id
    }
  ]
}

