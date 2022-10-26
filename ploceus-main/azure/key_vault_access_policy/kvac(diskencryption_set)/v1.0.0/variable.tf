variable "key_vault_access_policy_variables" {
  type = map(object({
    key_permissions         = list(string)
    secret_permissions      = list(string)
    storage_permissions     = list(string)
    key_vault_name          = string
    resource_group_name     = string
    disk_encryption_set_key = string
  }))
}

variable "disk_encryption_set_key" {
  description = "disk_encryption_set key which needs access to key vault"
}

variable "tenant_id" {
  description = "Tenant ID of the resource which needs access to key vault"
}

variable "object_id" {
  description = "Object ID of the resource which needs access to key vault"
}