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
    name                            = string
    resource_group_name             = string
    location                        = string
    enabled_for_disk_encryption     = bool
    enabled_for_deployment          = bool
    enabled_for_template_deployment = bool
    enable_rbac_authorization       = bool
    soft_delete_retention_days      = string
    purge_protection_enabled        = bool
    sku_name                        = string
    key_permissions                 = list(string)
    secret_permissions              = list(string)
    storage_permissions             = list(string)
    key_vault_tags                  = map(string)
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