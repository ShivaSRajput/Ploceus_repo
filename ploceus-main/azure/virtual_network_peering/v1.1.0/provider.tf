terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.9.0"
      configuration_aliases = [ azurerm.source_vnet_sub, azurerm.dest_vnet_sub ]
    }
  }
}
