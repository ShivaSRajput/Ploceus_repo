#RESOURCE GROUP VARIABLES
variable "resource_group_variables" {
  description = "Map of Resource groups"
  type = map(object({
    name                = string
    location            = string
    resource_group_tags = map(string)
  }))
  default = {}
}

#KEY VAULT
variable "key_vault_variables" {
  type = map(object({
    key_vault_name                                  = string
    key_vault_resource_group_name                   = string
    key_vault_location                              = string
    key_vault_enabled_for_disk_encryption           = bool
    key_vault_enabled_for_deployment                = bool
    key_vault_enabled_for_template_deployment       = bool
    key_vault_enable_rbac_authorization             = bool
    key_vault_soft_delete_retention_days            = string
    key_vault_purge_protection_enabled              = bool
    key_vault_sku_name                              = string
    key_vault_access_policy_key_permissions         = list(string)
    key_vault_access_policy_secret_permissions      = list(string)
    key_vault_access_policy_storage_permissions     = list(string)
    key_vault_access_policy_certificate_permissions = list(string)
    key_vault_tags                                  = map(string)
    key_vault_network_acls_enabled                  = bool
    key_vault_network_acls_bypass                   = string
    key_vault_network_acls_default_action           = string
    key_vault_network_acls_ip_rules                 = list(string)
    key_vault_network_acls_virtual_networks = list(object({
      virtual_network_name    = string
      subnet_name             = string
      subscription_id         = string
      virtual_network_rg_name = string
    }))
    key_vault_contact_information_enabled = bool
    key_vault_contact_email               = string
    key_vault_contact_name                = string
    key_vault_contact_phone               = string
  }))
}

#KEY VAULT KEY
variable "key_vault_key_variables" {
  type = map(object({
    name                = string
    resource_group_name = string
    key_vault_name      = string
    key_size            = number
    key_type            = string
    curve               = string
    key_opts            = list(string)
    not_before_date     = string
    expiration_date     = string
    key_vault_key_tags  = map(string)
  }))
}

#DISK ENCRYPTION SET variables
variable "disk_encryption_set_variables" {
  type = map(object({
    name                      = string
    resource_group_name       = string
    location                  = string
    auto_key_rotation_enabled = bool
    encryption_type           = string
    identity_type             = string //Currently only "SystemAssigned" is supported
    key_vault_name            = string
    key_vault_key_name        = string
    disk_encryption_set_tags  = map(string)
  }))
}