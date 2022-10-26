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
    key_vault_name                                  = "ploceuskeyvault000012"
    key_vault_location                              = "westus2"
    key_vault_resource_group_name                   = "ploceusrg000001"
    key_vault_enabled_for_disk_encryption           = true
    key_vault_enabled_for_deployment                = true
    key_vault_enabled_for_template_deployment       = true
    key_vault_enable_rbac_authorization             = false
    key_vault_soft_delete_retention_days            = "7"
    key_vault_purge_protection_enabled              = false
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
    key_vault_network_acls_bypass                     = "AzureServices"
    key_vault_network_acls_default_action             = "Allow"
    key_vault_network_acls_ip_rules                   = null
    key_vault_network_acls_virtual_networks           = []
    key_vault_contact_information_enabled             = false
    key_vault_contact_email                           = "test123@ploceus.com"
    key_vault_contact_name                            = "Ploceus"
    key_vault_contact_phone                           = "99999999999"

  }
}

#KEY VAULT ACCESS POLICY
key_vault_access_policy_variables = {
  "key_vault_access_policy_1" = {
    key_vault_access_policy_key_permissions         = ["Get", "List", "Create", "Delete", "Recover", "Backup", "Restore", "Purge"]
    key_vault_access_policy_secret_permissions      = ["Get", "List", "Delete", "Recover", "Backup", "Restore", "Purge"]
    key_vault_access_policy_storage_permissions     = []
    key_vault_access_policy_certificate_permissions = ["Backup", "Create", "Delete", "DeleteIssuers", "Get", "GetIssuers", "Import", "List", "ListIssuers", "ManageContacts", "ManageIssuers", "Purge", "Recover", "Restore", "SetIssuers", "Update"]
    key_vault_name                                  = "ploceuskeyvault000012"
    key_vault_resource_group_name                   = "ploceusrg000001"
    key_vault_access_resource_name                  = "user@ploceus.com"
    key_vault_access_resource_type                  = "User" # Possible options are User, SPN, Group, Application
  },
  "key_vault_access_policy_2" = {
    key_vault_access_policy_key_permissions         = ["Get", "List", "Create", "Delete", "Recover", "Backup", "Restore", "Purge"]
    key_vault_access_policy_secret_permissions      = ["Get", "List", "Delete", "Recover", "Backup", "Restore", "Purge"]
    key_vault_access_policy_storage_permissions     = []
    key_vault_access_policy_certificate_permissions = ["Backup", "Create", "Delete", "DeleteIssuers", "Get", "GetIssuers", "Import", "List", "ListIssuers", "ManageContacts", "ManageIssuers", "Purge", "Recover", "Restore", "SetIssuers", "Update"]
    key_vault_name                                  = "ploceuskeyvault000012"
    key_vault_resource_group_name                   = "ploceusrg000001"
    key_vault_access_resource_name                  = "PloceusGroup"
    key_vault_access_resource_type                  = "Group" # Possible options are User, SPN, Group, Application
  },
  "key_vault_access_policy_3" = {
    key_vault_access_policy_key_permissions         = ["Get", "List", "Create", "Delete", "Recover", "Backup", "Restore", "Purge"]
    key_vault_access_policy_secret_permissions      = ["Get", "List", "Delete", "Recover", "Backup", "Restore", "Purge"]
    key_vault_access_policy_storage_permissions     = []
    key_vault_access_policy_certificate_permissions = ["Backup", "Create", "Delete", "DeleteIssuers", "Get", "GetIssuers", "Import", "List", "ListIssuers", "ManageContacts", "ManageIssuers", "Purge", "Recover", "Restore", "SetIssuers", "Update"]
    key_vault_name                                  = "ploceuskeyvault000012"
    key_vault_resource_group_name                   = "ploceusrg000001"
    key_vault_access_resource_name                  = "ploceus"
    key_vault_access_resource_type                  = "SPN" # Possible options are User, SPN, Group, Application
  },
  "key_vault_access_policy_4" = {
    key_vault_access_policy_key_permissions         = ["Get", "List", "Create", "Delete", "Recover", "Backup", "Restore", "Purge"]
    key_vault_access_policy_secret_permissions      = ["Get", "List", "Delete", "Recover", "Backup", "Restore", "Purge"]
    key_vault_access_policy_storage_permissions     = []
    key_vault_access_policy_certificate_permissions = ["Backup", "Create", "Delete", "DeleteIssuers", "Get", "GetIssuers", "Import", "List", "ListIssuers", "ManageContacts", "ManageIssuers", "Purge", "Recover", "Restore", "SetIssuers", "Update"]
    key_vault_name                                  = "ploceuskeyvault000012"
    key_vault_resource_group_name                   = "ploceusrg000001"
    key_vault_access_resource_name                  = "ploceus"
    key_vault_access_resource_type                  = "Application" # Possible options are User, SPN, Group, Application
  }
}








