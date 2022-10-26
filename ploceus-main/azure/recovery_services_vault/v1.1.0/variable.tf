#Variables for Recovery Service Vault
variable "recovery_service_vault_variable" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    sku                 = string
    lock_level          = string
    notes               = string
    soft_delete_enabled = bool
    identity = map(object({
      type = string
    }))
    storage_mode_type            = string
    cross_region_restore_enabled = bool
    encryption = map(object({
      key_id                            = string
      infrastructure_encryption_enabled = string
      use_system_assigned_identity      = bool
    }))
    tags = map(string)
  }))
}

