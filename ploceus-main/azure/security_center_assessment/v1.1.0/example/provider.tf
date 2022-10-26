terraform {
  required_providers {
    azurerm = {
      source                = "hashicorp/azurerm"
      version               = "=3.9.0"
      configuration_aliases = [azurerm.azure_virtual_machine_sub, azurerm.security_center_assessment_sub]
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  alias = "azure_virtual_machine_sub"
  features {}
  use_msi         = true
  subscription_id = var.virtual_machine_subscription_id
  tenant_id       = var.virtual_machine_tenant_id
}

provider "azurerm" {
  alias = "security_center_assessment_sub"
  features {}
  use_msi         = true
  subscription_id = var.security_center_assessment_subscription_id
  tenant_id       = var.security_center_assessment_tenant_id
}
