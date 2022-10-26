variable "random_password_length" {
  description = "The desired length of random password created by this module"
  default     = 32
}

variable "key_vault_cert_variables" {
  type = map(object({
    name                = string
    password            = string
    ProviderName        = string
    org_id              = string
    account_id          = string
    email               = string
    first_name          = string
    last_name           = string
    phone               = string
    resource_group_name = string
    key_vault_name      = string
    tags                = map(string)
    min_upper           = number
    min_lower           = number
    min_numeric         = number
    min_special         = number
    length              = number
  }))
}
