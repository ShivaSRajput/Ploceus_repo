terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.9.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  alias = "main_sub"
  features {}
  subscription_id = var.main_sub_subscription_id
  #use_msi = true
  tenant_id = var.main_sub_tenant_id
}

provider "azurerm" {
  alias = "servicebus_sub"
  features {}
  subscription_id = var.servicebus_sub_subscription_id
  #use_msi = true
  tenant_id = var.servicebus_sub_tenant_id
}

provider "azurerm" {
  alias = "storage_sub"
  features {}
  subscription_id = var.storage_sub_subscription_id
  #use_msi = true
  tenant_id = var.storage_sub_tenant_id
}