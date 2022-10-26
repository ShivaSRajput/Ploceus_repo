terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.9.0"
    }
  }
}

provider "azurerm" {
  alias = "monitor_diagnostic_sub"
  features {}
  subscription_id = var.monitor_diagnostic_sub_subscription_id
  tenant_id       = var.monitor_diagnostic_sub_tenant_id
  #use_msi         = true
}
provider "azurerm" {
  alias = "log_analytics_workspace_sub"
  features {}
  subscription_id = var.log_analytics_workspace_sub_subscription_id
  tenant_id       = var.log_analytics_workspace_sub_tenant_id
  #use_msi         = true
}
provider "azurerm" {
  alias = "storage_resource_sub"
  features {}
  subscription_id = var.storage_resource_sub_subscription_id
  tenant_id       = var.storage_resource_sub_tenant_id
  #use_msi         = true
}
provider "azurerm" {
  alias = "eventhub_sub"
  features {}
  subscription_id = var.eventhub_sub_subscription_id
  tenant_id       = var.eventhub_sub_tenant_id
  #use_msi         = true
}

