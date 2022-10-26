terraform {
  required_providers {
    azurerm = {
      source                = "hashicorp/azurerm"
      version               = "3.9.0"
      configuration_aliases = [azurerm.log_analytics_workspace_sub,azurerm.monitor_scheduled_query_rules_log_sub]
    }
  }
}

