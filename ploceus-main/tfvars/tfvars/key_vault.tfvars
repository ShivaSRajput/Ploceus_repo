key_vault_variables = {
  "key_vault_1" = {
    name                                  = "ploceuskeyvault000001a"
    location                              = "westus2"
    resource_group_name                   = "ploceusrg000001"
    enabled_for_disk_encryption           = true
    enabled_for_deployment                = true
    enabled_for_template_deployment       = true
    enable_rbac_authorization             = false
    soft_delete_retention_days            = "7"
    purge_protection_enabled              = false
    sku_name                              = "standard"
    access_policy_key_permissions         = ["get", "list", "create", "delete", "recover", "backup", "restore", "purge"]
    access_policy_secret_permissions      = ["get", "list", "delete", "recover", "backup", "restore", "purge"]
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