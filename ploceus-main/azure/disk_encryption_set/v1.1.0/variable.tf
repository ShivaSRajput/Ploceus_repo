#DISK ENCRYPTION SET
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