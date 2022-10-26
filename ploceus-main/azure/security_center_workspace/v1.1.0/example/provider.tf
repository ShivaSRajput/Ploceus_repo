terraform {
  required_providers {
    azurerm = {
      source                = "hashicorp/azurerm"
      version               = "3.9.0"
      configuration_aliases = [azurerm.log_analytics_sub, azurerm.security_center_sub]
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  alias = "log_analytics_sub"
  features {}
  use_msi         = true
  subscription_id = var.log_analytics_subscription_id
  tenant_id       = var.log_analytics_tenant_id
}

provider "azurerm" {
  alias = "security_center_sub"
  features {}
  use_msi         = true
  subscription_id = var.security_center_subscription_id
  tenant_id       = var.security_center_tenant_id
}