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
