terraform {
  required_providers {
    azurerm = {
      source                = "hashicorp/azurerm"
      version               = "3.9.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  alias = "log_analytics_workspace_sub"
  features {}
  #use_msi         = true
  subscription_id = var.log_analytics_workspace_subscription_id
  tenant_id       = var.log_analytics_workspace_tenant_id
}

provider "azurerm" {
  alias = "monitor_scheduled_query_rules_log_sub"
  features {}
  #use_msi         = true
  subscription_id = var.monitor_scheduled_query_rules_log_subscription_id
  tenant_id       = var.monitor_scheduled_query_rules_log_tenant_id
}

