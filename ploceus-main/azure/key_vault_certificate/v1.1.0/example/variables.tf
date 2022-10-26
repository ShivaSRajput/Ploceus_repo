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

variable "key_vault_certificate_variables" {
  type = map(object({
    certificate_name              = string
    key_vault_name                = string
    key_vault_resource_group_name = string
    certificate = list(object({
      contents = string
      password = string
    }))
    certificate_policy = list(object({
      issuer_parameters = list(object({
        issuer_name = string
      }))
      key_properties = list(object({
        curve      = string
        exportable = bool
        key_size   = string
        key_type   = string
        reuse_key  = bool
      }))
      lifetime_action = list(object({
        action = list(object({
          action_type = string
        }))
        trigger = list(object({
          days_before_expiry = string
        }))
      }))
      secret_properties = list(object({
        content_type = string
      }))
      x509_certificate_properties = list(object({
        extended_key_usage = list(string)
        key_usage          = list(string)
        subject            = string
        validity_in_months = string
        subject_alternative_names = list(object({
          dns_names = list(string)
          emails    = list(string)
          upns      = list(string)
        }))
      }))
    }))
    key_vault_certificate_tags = map(string)
  }))
}
