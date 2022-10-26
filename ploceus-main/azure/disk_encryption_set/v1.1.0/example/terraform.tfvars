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

# KEY VAULT 
key_vault_variables = {
  "key_vault_1" = {
    key_vault_name                                  = "ploceuskeyvault0000014"
    key_vault_location                              = "westus2"
    key_vault_resource_group_name                   = "ploceusrg000001"
    key_vault_enabled_for_disk_encryption           = true
    key_vault_enabled_for_deployment                = true
    key_vault_enabled_for_template_deployment       = true
    key_vault_enable_rbac_authorization             = false
    key_vault_soft_delete_retention_days            = "7"
    key_vault_purge_protection_enabled              = true
    key_vault_sku_name                              = "standard"
    key_vault_access_policy_key_permissions         = ["Get", "List", "Create", "Delete", "Recover", "Backup", "Restore", "Purge"]
    key_vault_access_policy_secret_permissions      = ["Get", "List", "Delete", "Recover", "Backup", "Restore", "Purge"]
    key_vault_access_policy_storage_permissions     = []
    key_vault_access_policy_certificate_permissions = ["Backup", "Create", "Delete", "DeleteIssuers", "Get", "GetIssuers", "Import", "List", "ListIssuers", "ManageContacts", "ManageIssuers", "Purge", "Recover", "Restore", "SetIssuers", "Update"]
    key_vault_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
    key_vault_network_acls_enabled                    = false
    key_vault_network_acls_virtual_networks           = []
    key_vault_network_acls_bypass                     = "AzureServices"
    key_vault_network_acls_default_action             = "Allow"
    key_vault_network_acls_ip_rules                   = null
    key_vault_network_acls_virtual_network_subnet_ids = null
    key_vault_contact_information_enabled             = false
    key_vault_contact_email                           = "test123@ploceus.com"
    key_vault_contact_name                            = "Ploceus"
    key_vault_contact_phone                           = "99999999999"

  }
}

#KEY VAULT KEY
key_vault_key_variables = {
  "key_vault_key_1" = {
    name                = "ploceuskey0000001"
    resource_group_name = "ploceusrg000001"
    key_vault_name      = "ploceuskeyvault0000014"
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
    key_vault_name            = "ploceuskeyvault0000014"
    key_vault_key_name        = "ploceuskey0000001"
    auto_key_rotation_enabled = null
    encryption_type           = null
    identity_type             = "SystemAssigned" #Currently only "SystemAssigned" is supported
    disk_encryption_set_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}