terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      configuration_aliases = [
        azurerm.storage_sub,
        azurerm.servicebus_sub,
        azurerm.main_sub
      ]
    }
  }
}