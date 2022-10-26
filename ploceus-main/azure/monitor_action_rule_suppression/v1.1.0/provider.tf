terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.9.0"
      configuration_aliases = [
        azurerm.monitor_action_rule_suppression_sub,
        azurerm.scope_resourcegroup_sub,
        azurerm.scope_resource_sub
      ]
    }
  }
}
