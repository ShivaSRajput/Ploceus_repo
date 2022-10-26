terraform {
  required_providers {
    azurerm = {
      source                = "hashicorp/azurerm"
      version               = "3.9.0"
      configuration_aliases = [azurerm.target_resource_sub, azurerm.advanced_threat_protection_sub]
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  alias = "target_resource_sub"
  features {}
  # use_msi         = true
  subscription_id = var.resource_subscription_id
  tenant_id       = var.resource_tenant_id
}

provider "azurerm" {
  alias = "advanced_threat_protection_sub"
  features {}
  # use_msi         = true
  subscription_id = var.advanced_threat_protection_subscription_id
  tenant_id       = var.advanced_threat_protection_tenant_id
}
