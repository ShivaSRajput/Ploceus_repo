terraform {
  required_providers {
    azurerm = {
      source                = "hashicorp/azurerm"
      version               = "=3.9.0"
      configuration_aliases = [azurerm.azure_virtual_machine_sub, azurerm.security_center_assessment_sub]
    }
  }
}
