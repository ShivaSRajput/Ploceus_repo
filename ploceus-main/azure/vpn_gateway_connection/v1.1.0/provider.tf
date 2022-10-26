terraform {
  required_providers {
    azurerm = {
      source                = "hashicorp/azurerm"
      version               = "=3.9.0"
      configuration_aliases = [azurerm.vpn_gateway_subscription, azurerm.vpn_site_subscription]
    }
  }
}
