terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.9.0"
      configuration_aliases = [
        azurerm.scope_resouce_sub,
        azurerm.action_group_sub,
        azurerm.smart_detector_alert_rule_sub
      ]
    }
  }
}