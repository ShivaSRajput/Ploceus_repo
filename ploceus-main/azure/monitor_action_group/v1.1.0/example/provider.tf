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
  alias = "action_group_sub"
  features {
    
  }
  subscription_id = var.action_group_sub_subscription_id
  tenant_id =var.action_group_sub_tenant_id
  #use_msi = false
}

