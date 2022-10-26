resource "azurerm_security_center_assessment_policy" "security_center_assessment_policy" {
  provider     = azurerm.security_center_assessment_sub
  for_each     = var.security_center_assessment_variables
  description  = each.value.policy_description
  display_name = each.value.policy_display_name
  severity     = each.value.policy_severity
}

data "azurerm_virtual_machine" "virtual_machine" {
  provider            = azurerm.azure_virtual_machine_sub
  for_each            = var.security_center_assessment_variables
  name                = each.value.virtual_machine_name
  resource_group_name = each.value.virtual_machine_rg
}

resource "azurerm_security_center_assessment" "security_center_assessment" {
  provider             = azurerm.security_center_assessment_sub
  for_each             = var.security_center_assessment_variables
  assessment_policy_id = azurerm_security_center_assessment_policy.security_center_assessment_policy[each.key].id
  target_resource_id   = data.azurerm_virtual_machine.virtual_machine[each.key].id
  additional_data      = each.value.additional_data
  dynamic "status" {
    for_each = each.value.status != null ? toset(each.value.status) : []
    content {
      code        = status.value.code
      cause       = status.value.cause
      description = status.value.description
    }
  }
}
