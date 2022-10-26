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
    resource_group_name             = "ploceusrg000001"
    enabled_for_disk_encryption     = true
    enabled_for_deployment          = true
    enabled_for_template_deployment = true
    enable_rbac_authorization       = false
    soft_delete_retention_days      = "7"
    purge_protection_enabled        = true
    sku_name                        = "standard"
    key_permissions                 = ["get", "list", "create", "delete", "recover", "backup", "restore", "purge"]
    secret_permissions              = ["get", "list", "delete", "recover", "backup", "restore", "purge"]
    storage_permissions             = []
    key_vault_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  },
  "key_vault_2" = {
    name                            = "ploceuskeyvault000001b"
    location                        = "westus2"
    resource_group_name             = "ploceusrg000001"
    enabled_for_disk_encryption     = true
    enabled_for_deployment          = true
    enabled_for_template_deployment = true
    enable_rbac_authorization       = false
    soft_delete_retention_days      = "7"
    purge_protection_enabled        = true
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
    name                = "ploceuskeyavaultkey000001a1"
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
  },
  "key_vault_key_2" = {
    name                = "ploceuskeyavaultkey000001a2"
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
  },
  "key_vault_key_3" = {
    name                = "ploceuskeyavaultkey000001b1"
    resource_group_name = "ploceusrg000001"
    key_vault_name      = "ploceuskeyvault000001b"
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

#DISK ENCRYPTION SET
disk_encryption_set_variables = {
  "disk_encryption_set_1" = {
    name                      = "ploceuploceusdiskencryptionset000001a1"
    resource_group_name       = "ploceusrg000001"
    location                  = "westus2"
    key_vault_name            = "ploceuskeyvault000001a"
    key_vault_key_name        = "ploceuskeyavaultkey000001a1"
    auto_key_rotation_enabled = null
    encryption_type           = null
    identity_type             = null #Currently only "SystemAssigned" is supported
    disk_encryption_set_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  },
  "disk_encryption_set_2" = {
    name                      = "ploceuploceusdiskencryptionset000001a2"
    resource_group_name       = "ploceusrg000001"
    location                  = "westus2"
    key_vault_name            = "ploceuskeyvault000001a"
    key_vault_key_name        = "ploceuskeyavaultkey000001a2"
    auto_key_rotation_enabled = null
    encryption_type           = null
    identity_type             = null #Currently only "SystemAssigned" is supported
    disk_encryption_set_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  },
  "disk_encryption_set_3" = {
    name                      = "ploceuploceusdiskencryptionset000001b1"
    resource_group_name       = "ploceusrg000001"
    location                  = "westus2"
    key_vault_name            = "ploceuskeyvault000001b"
    key_vault_key_name        = "ploceuskeyavaultkey000001b1"
    auto_key_rotation_enabled = null
    encryption_type           = null
    identity_type             = null #Currently only "SystemAssigned" is supported
    disk_encryption_set_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

#KEY VAULT ACCESS POLICY
key_vault_access_policy_variables = {
  "key_vault_access_policy_1" = {
    key_permissions         = ["Get", "WrapKey", "UnwrapKey"]
    secret_permissions      = []
    storage_permissions     = []
    key_vault_name          = "ploceuskeyvault000001a"
    resource_group_name     = "ploceusrg000001"
    disk_encryption_set_key = "disk_encryption_set_1"
  },
  "key_vault_access_policy_2" = {
    key_permissions         = ["Get", "WrapKey", "UnwrapKey"]
    secret_permissions      = []
    storage_permissions     = []
    key_vault_name          = "ploceuskeyvault000001a"
    resource_group_name     = "ploceusrg000001"
    disk_encryption_set_key = "disk_encryption_set_2"
  },
  "key_vault_access_policy_3" = {
    key_permissions         = ["Get", "WrapKey", "UnwrapKey"]
    secret_permissions      = []
    storage_permissions     = []
    key_vault_name          = "ploceuskeyvault000001b"
    resource_group_name     = "ploceusrg000001"
    disk_encryption_set_key = "disk_encryption_set_3"
  }
}






