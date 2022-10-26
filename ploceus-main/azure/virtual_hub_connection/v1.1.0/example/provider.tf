terraform {
  required_providers {
    azurerm = {
      source                = "hashicorp/azurerm"
      version               = "=3.9.0"
      configuration_aliases = [azurerm.virtual_hub_sub, azurerm.vnet_sub]
    }
  }
}


# Configure the Microsoft Azure Provider
provider "azurerm" {
  alias = "virtual_hub_sub"
  features {}
  use_msi         = true
  subscription_id = var.virtual_hub_subscription_id
  tenant_id       = var.virtual_hub_tenant_id
}

provider "azurerm" {
  alias = "vnet_sub"
  features {}
  use_msi         = true
  subscription_id = var.vnet_subscription_id
  tenant_id       = var.vnet_tenant_id
}