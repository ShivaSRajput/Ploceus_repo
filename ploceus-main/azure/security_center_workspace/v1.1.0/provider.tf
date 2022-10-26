terraform {
  required_providers {
    azurerm = {
      source                = "hashicorp/azurerm"
      version               = "=3.9.0"
      configuration_aliases = [azurerm.log_analytics_sub, azurerm.security_center_sub]
    }
  }
}
