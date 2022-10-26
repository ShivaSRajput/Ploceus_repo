resource "azurerm_security_center_assessment_policy" "security_center_assessment_policy" {
  for_each                = var.security_center_assessment_policy_variables
  description             = each.value.description
  display_name            = each.value.display_name
  severity                = each.value.severity
  categories              = each.value.categories
  implementation_effort   = each.value.implementation_effort
  remediation_description = each.value.remediation_description
  threats                 = each.value.threats
  user_impact             = each.value.user_impact
}
