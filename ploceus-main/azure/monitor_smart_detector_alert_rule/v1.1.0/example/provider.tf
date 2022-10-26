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
  features {}
  alias           = "action_group_sub"
  use_msi         = false
  subscription_id = var.action_group_sub_subscription_id
  tenant_id       = var.action_group_sub_tenant_id
}
provider "azurerm" {
  features {}
  alias           = "scope_resouce_sub"
  use_msi         = false
  subscription_id = var.scope_resouce_sub_subscription_id
  tenant_id       = var.scope_resouce_sub_tenant_id
}

provider "azurerm" {
  features {}
  alias           = "smart_detector_alert_rule_sub"
  use_msi         = false
  subscription_id = var.smart_detector_alert_rule_sub_subscription_id
  tenant_id       = var.smart_detector_alert_rule_sub_tenant_id
}