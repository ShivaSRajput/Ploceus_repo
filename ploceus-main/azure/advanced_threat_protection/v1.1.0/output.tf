output "advanced_threat_protection_ids" {
  value       = { for k, v in var.advanced_threat_protection_variables : k => azurerm_advanced_threat_protection.advanced_threat_protection[k].id }
  description = "Advanced Threat protection output values"
}
