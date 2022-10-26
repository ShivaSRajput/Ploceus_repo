#RESOURCE GROUP 
resource_group_variables = {
  "resource_group_1" = {
    name     = "ploceusrg0000-01"
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
    name                                  = "ploceuskeyvault000001a"
    location                              = "westus2"
    resource_group_name                   = "ploceusrg0000-01"
    enabled_for_disk_encryption           = true
    enabled_for_deployment                = true
    enabled_for_template_deployment       = true
    enable_rbac_authorization             = false
    soft_delete_retention_days            = "7"
    purge_protection_enabled              = false
    sku_name                              = "standard"
    access_policy_key_permissions         = ["Get", "List","Create","Restore", "Purge"]
    access_policy_secret_permissions      = ["Get", "List","Set", "Delete", "Recover", "Backup", "Restore", "Purge"]
    access_policy_storage_permissions     = []
    access_policy_certificate_permissions = ["Backup", "Create", "Delete","Get"]
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

key_vault_secret_variables = {
  "key_new" = {
    name            = "KeyAish"
    value           = "HowYouDoin"
    content_type    = ""
    not_before_date = ""
    expiration_date = ""
    resource_group_name = "ploceusrg0000-01"
    key_vault_name      = "ploceuskeyvault000001a"
    tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
    min_upper = 10
    min_lower = 5
    min_numeric = 5
    min_special = 3
    length = 32      
  }
  "key_3" = {
    name            = "Newkey"
    value           = ""
    content_type    = ""
    not_before_date = ""
    expiration_date = ""
    resource_group_name = "ploceusrg0000-01"
    key_vault_name      = "ploceuskeyvault000001a"
    tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
    min_upper = 10
    min_lower = 5
    min_numeric = 5
    min_special = 3
    length = 32    
  }
}

