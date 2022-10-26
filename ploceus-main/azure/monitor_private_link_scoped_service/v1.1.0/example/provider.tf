terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.9.0"
    }
  }
}


provider "azurerm" {
  alias = "monitor_private_link_scoped_service_sub"
  features {}
  subscription_id = var.monitor_private_link_scoped_service_sub_subscription_id
  tenant_id       = var.monitor_private_link_scoped_service_sub_tenant_id
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
  alias = "applicationinsight_sub"
  features {}
  subscription_id = var.applicationinsight_sub_subscription_id
  tenant_id       = var.applicationinsight_sub_tenant_id
  #use_msi         = true
}