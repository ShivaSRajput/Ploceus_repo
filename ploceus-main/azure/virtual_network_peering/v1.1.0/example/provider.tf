terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.9.0"
      configuration_aliases = [ azurerm.sourcesub, azurerm.destsub ]
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  alias = "source_vnet_sub"
  features {}
  use_msi         = true
  subscription_id = var.source_subscription_id
  tenant_id       = var.source_tenant_id
}

provider "azurerm" {
  alias = "dest_vnet_sub"
  features {}
  use_msi         = true
  subscription_id = var.destination_subscription_id
  tenant_id       = var.destination_tenant_id
}