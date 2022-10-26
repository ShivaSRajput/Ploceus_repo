terraform {
  required_providers {
    azurerm = {
      source                = "hashicorp/azurerm"
      version               = "=3.9.0"
      configuration_aliases = [azurerm.vpn_gateway_subscription, azurerm.vpn_site_subscription]
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  alias = "vpn_gateway_subscription"
  use_msi         = true
  subscription_id = var.vpn_gateway_subscription_id
  tenant_id       = var.vpn_gateway_tenant_id
  features {}


}

provider "azurerm" {
  alias = "vpn_site_subscription"
  use_msi         = true
  subscription_id = var.vpn_site_subscription_id
  tenant_id       = var.vpn_site_tenant_id
  features {}

}