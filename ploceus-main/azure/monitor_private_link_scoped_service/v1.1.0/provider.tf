
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.9.0"
      configuration_aliases = [
        azurerm.monitor_private_link_scoped_service_sub,
        azurerm.log_analytics_workspace_sub,
        azurerm.applicationinsight_sub
      ]
    }
  }
}
