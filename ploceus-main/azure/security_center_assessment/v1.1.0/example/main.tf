module "security_center_assessment" {
  source = "../"
  providers = {
    azurerm.azure_virtual_machine_sub      = azurerm.azure_virtual_machine_sub
    azurerm.security_center_assessment_sub = azurerm.security_center_assessment_sub
  }
  security_center_assessment_variables = var.security_center_assessment_variables
}


