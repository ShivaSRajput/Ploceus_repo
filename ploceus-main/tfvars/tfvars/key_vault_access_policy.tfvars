key_vault_access_policy_variables = {
  "key_vault_access_policy_1" = {
    key_permissions         = ["Get", "WrapKey", "UnwrapKey"]
    secret_permissions      = []
    storage_permissions     = []
    key_vault_name          = "ploceuskeyvault000001a"
    resource_group_name     = "ploceusrg000001"
    disk_encryption_set_key = "disk_encryption_set_1"
  }
}  