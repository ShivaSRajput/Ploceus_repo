terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.9.0"
    }
  }
}


provider "azurerm" {
  alias = "postgresql_server"
  features {}
  use_msi         = true
  subscription_id = var.postgresql_server_subscription_id
  tenant_id       = var.postgresql_server_tenant_id
}