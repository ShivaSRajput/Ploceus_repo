#RESOURCE GROUP 
resource_group_variables = {
  "resource_group_1" = {
    name     = "ploceusrg000001"
    location = "westus2"
    resource_group_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}


#KEY VAULT
key_vault_variables = {
  "key_vault_1" = {
    name                            = "ploceuskeyvault000001a"
    location                        = "westus2"
    resource_group_name             = "ploceusrg00002"
    enabled_for_disk_encryption     = true
    enabled_for_deployment          = true
    enabled_for_template_deployment = true
    enable_rbac_authorization       = false
    soft_delete_retention_days      = "7"
    purge_protection_enabled        = false
    sku_name                        = "standard"
    key_permissions                 = ["get", "list", "create", "delete", "recover", "backup", "restore", "purge"]
    secret_permissions              = ["get", "list", "delete", "recover", "backup", "restore", "purge"]
    storage_permissions             = []
    key_vault_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

#KEY VAULT KEY
key_vault_key_variables = {
  "key_vault_key_1" = {
    name                = "ploceuskeyavaultkey000001a"
    resource_group_name = "ploceusrg000001"
    key_vault_name      = "ploceuskeyvault000001a"
    key_type            = "RSA"
    key_size            = 2048
    curve               = null
    key_opts            = ["decrypt", "encrypt", "sign", "unwrapKey", "verify", "wrapKey"]
    not_before_date     = null
    expiration_date     = null
    key_vault_key_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}
