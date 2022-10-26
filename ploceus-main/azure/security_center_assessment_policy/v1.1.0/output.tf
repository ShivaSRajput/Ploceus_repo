output "security_center_assessment_policy_outputs" {
  value = [
    for k, v in var.security_center_assessment_policy_variables :
    {
      id   = azurerm_security_center_assessment_policy.security_center_assessment_policy[k].id
      name = azurerm_security_center_assessment_policy.security_center_assessment_policy[k].name
    }
  ]
}
