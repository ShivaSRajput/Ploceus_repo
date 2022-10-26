terraform {
  required_providers {
    azurerm = {
      source                = "hashicorp/azurerm"
      version               = "=3.9.0"
      configuration_aliases = [azurerm.virtual_hub_sub, azurerm.vnet_sub]
    }
  }
}
