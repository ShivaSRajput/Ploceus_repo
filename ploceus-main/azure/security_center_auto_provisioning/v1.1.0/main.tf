resource "azurerm_security_center_auto_provisioning" "security_center_auto_provisioning" {
  for_each       = var.security_center_auto_provisioning_variables
  auto_provision = each.value.auto_provision
}
