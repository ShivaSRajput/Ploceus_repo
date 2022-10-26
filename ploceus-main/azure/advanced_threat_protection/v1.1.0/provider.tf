terraform {
  required_providers {
    azurerm = {
      source                = "hashicorp/azurerm"
      version               = "3.9.0"
      configuration_aliases = [azurerm.target_resource_sub, azurerm.advanced_threat_protection_sub]
    }
  }
}

