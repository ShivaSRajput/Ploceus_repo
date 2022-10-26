output "security_center_assessment_ids" {
value = { for k, v in var.security_center_assessment_variables : k => azurerm_security_center_assessment.security_center_assessment[k].id }
}
