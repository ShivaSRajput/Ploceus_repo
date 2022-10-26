terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      #version = "~> 3.10.0"
      version = "~> 3.9.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}