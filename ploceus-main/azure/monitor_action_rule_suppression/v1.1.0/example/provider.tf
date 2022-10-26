terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.9.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {

  alias = "monitor_action_rule_suppression_sub"
  features {}
  subscription_id = var.monitor_action_rule_suppression_sub_subscription_id
  tenant_id       = var.monitor_action_rule_suppression_sub_tenant_id
  #use_msi         = true
}
provider "azurerm" {
  alias = "scope_resourcegroup_sub"
  features {}
  subscription_id = var.scope_resourcegroup_sub_subscription_id
  tenant_id       = var.scope_resourcegroup_sub_tenant_id
  #use_msi         = true
}
provider "azurerm" {
  alias = "scope_resource_sub"
  features {}
  subscription_id = var.scope_resource_sub_subscription_id
  tenant_id       = var.scope_resource_sub_tenant_id
  #use_msi         = true
}