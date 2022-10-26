#RESOURCE GROUP 
resource_group_variables = {
  "resource_group_1" = {
    name     = "ploceusrg000002"
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
    name                                  = "ploceuskeyvault000001b"
    location                              = "westus2"
    resource_group_name                   = "ploceusrg000002"
    enabled_for_disk_encryption           = true
    enabled_for_deployment                = true
    enabled_for_template_deployment       = true
    enable_rbac_authorization             = false
    soft_delete_retention_days            = "7"
    purge_protection_enabled              = false
    sku_name                              = "standard"
    access_policy_key_permissions         = ["Get", "List", "Create", "Delete", "Recover", "Backup", "Restore", "Purge"]
    access_policy_secret_permissions      = ["Get", "List", "Delete", "Recover", "Backup", "Restore", "Purge"]
    access_policy_storage_permissions     = []
    access_policy_certificate_permissions = ["Backup", "Create", "Delete", "DeleteIssuers", "Get", "GetIssuers", "Import", "List", "ListIssuers", "ManageContacts", "ManageIssuers", "Purge", "Recover", "Restore", "SetIssuers", "Update"]
    key_vault_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
    network_acls_enabled                    = false
    network_acls_bypass                     = "AzureServices"
    network_acls_default_action             = "Allow"
    network_acls_ip_rules                   = null
    network_acls_virtual_network_subnet_ids = null
    contact_information_enabled             = false
    contact_email                           = "test123@gmail.com"
    contact_name                            = "TestProject"
    contact_phone                           = "99999999999"

  }
}
#KEY VAULT KEY
key_vault_key_variables = {
  "key_vault_key_1" = {
    name                = "ploceuskeyavaultkey000001b"
    resource_group_name = "ploceusrg000002"
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
