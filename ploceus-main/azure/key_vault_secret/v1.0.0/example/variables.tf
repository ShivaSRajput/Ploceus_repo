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
    name                                    = string
    resource_group_name                     = string
    location                                = string
    enabled_for_disk_encryption             = bool
    enabled_for_deployment                  = bool
    enabled_for_template_deployment         = bool
    enable_rbac_authorization               = bool
    soft_delete_retention_days              = string
    purge_protection_enabled                = bool
    sku_name                                = string
    access_policy_key_permissions           = list(string)
    access_policy_secret_permissions        = list(string)
    access_policy_storage_permissions       = list(string)
    access_policy_certificate_permissions   = list(string)
    key_vault_tags                          = map(string)
    network_acls_enabled                    = bool
    network_acls_bypass                     = string
    network_acls_default_action             = string
    network_acls_ip_rules                   = list(string)
    network_acls_virtual_network_subnet_ids = list(string)
    contact_information_enabled             = bool
    contact_email                           = string
    contact_name                            = string
    contact_phone                           = string
  }))
}


variable "random_password_length" {
  description = "The desired length of random password created by this module"
  default     = 32
}


variable "key_vault_secret_variables" {
  type = map(object({
    name            = string
    value           = string
    content_type    = string
    not_before_date = string
    expiration_date = string
    resource_group_name = string
    key_vault_name      = string
    tags                = map(string)
    min_upper = number
    min_lower = number
    min_numeric = number
    min_special = number
    length = number
  }))

}



