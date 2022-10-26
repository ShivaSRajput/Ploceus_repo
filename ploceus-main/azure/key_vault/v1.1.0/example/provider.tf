terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.9.0"
    }
  }
}
#Do Not Delete Comments in this File, can be referenced for future implementations
# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {
    key_vault {
      # available in 2.x
      purge_soft_delete_on_destroy = false
      # recover_soft_deleted_key_vaults = false

      # available when opted into the 3.0 Beta
      purge_soft_deleted_certificates_on_destroy = true
      purge_soft_deleted_keys_on_destroy         = false
      # purge_soft_deleted_secrets_on_destroy      = false
      # recover_soft_deleted_certificates          = true
      # recover_soft_deleted_secrets               = true
      # recover_soft_deleted_keys                  = true
    }
  }

}
