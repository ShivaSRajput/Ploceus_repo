variable "key_vault_key_variables" {
  type = map(object({
    name                = string
    resource_group_name = string
    key_vault_name      = string
    key_type            = string
    key_size            = number
    curve               = string
    key_opts            = list(string)
    not_before_date     = string
    expiration_date     = string
    key_vault_key_tags  = map(string)
  }))
}