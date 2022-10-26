terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.9.0"
      configuration_aliases = [
        azurerm.monitor_diagnostic_sub,
        azurerm.log_analytics_workspace_sub,
        azurerm.storage_resource_sub,
        azurerm.eventhub_sub
      ]
    }
  }
}