variable "key_vault_access_policy_variables" {
  type = map(object({
    key_vault_access_policy_key_permissions         = list(string)
    key_vault_access_policy_secret_permissions      = list(string)
    key_vault_access_policy_storage_permissions     = list(string)
    key_vault_access_policy_certificate_permissions = list(string)
    key_vault_name                                  = string
    key_vault_resource_group_name                   = string
    key_vault_access_resource_name                  = string
    key_vault_access_resource_type                  = string
  }))
}