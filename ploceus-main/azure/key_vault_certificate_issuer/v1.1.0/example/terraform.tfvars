#RESOURCE GROUP 
resource_group_variables = {
  "resource_group_1" = {
    name     = "ploceusrg-007"
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
    name                                  = "ploceuskeyvault-007"
    location                              = "westus2"
    resource_group_name                   = "ploceusrg-007"
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
    contact_phone                           = "+91-xxxxxxxxxx"

  }
}

key_vault_cert_variables = {
  "cert1" = {
    name                = "ploceuscert1"
    password            = "pass1"
    ProviderName        = "DigiCert" # following are the 5 options that are available : "DigiCert","GlobalSign","OneCertV2-PrivateCA","OneCertV2-PublicCA","SslAdminV2"
    org_id              = "NeudesicPloceus"
    account_id          = "NeudesicPloceus1"
    email               = "xxxxx@neudesic.com"
    first_name          = "xxxxxxxxxx"
    last_name           = "xxxxxxxxxx"
    phone               = "+91-xxxxxxxxxx"
    resource_group_name = "ploceusrg-007"
    key_vault_name      = "ploceuskeyvault-007"
    tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
    min_upper   = 10
    min_lower   = 5
    min_numeric = 5
    min_special = 3
    length      = 32
  }
  "cert2" = {
    name                = "ploceuscert2"
    password            = "pass2"
    ProviderName        = "GlobalSign" # following are the 5 options that are available : "DigiCert","GlobalSign","OneCertV2-PrivateCA","OneCertV2-PublicCA","SslAdminV2"
    org_id              = "NeudesicPloceus"
    account_id          = "NeudesicPloceus1"
    email               = "xxxxx@neudesic.com"
    first_name          = "xxxxxxxxxx"
    last_name           = "xxxxxxxxxx"
    phone               = "+91-xxxxxxxxxx"
    resource_group_name = "ploceusrg-007"
    key_vault_name      = "ploceuskeyvault-007"
    tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
    min_upper   = 10
    min_lower   = 5
    min_numeric = 5
    min_special = 3
    length      = 32
  }
}