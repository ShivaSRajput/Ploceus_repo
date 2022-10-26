data "azurerm_resources" "target_resource_id" {
  provider            = azurerm.target_resource_sub
  for_each            = var.advanced_threat_protection_variables
  name                = each.value.target_resource_name
  resource_group_name = each.value.target_resource_group_name
}
resource "azurerm_advanced_threat_protection" "advanced_threat_protection" {
  provider           = azurerm.advanced_threat_protection_sub
  for_each           = var.advanced_threat_protection_variables
  enabled            = each.value.enabled
  target_resource_id = data.azurerm_resources.target_resource_id[each.key].resources[0].id
}
