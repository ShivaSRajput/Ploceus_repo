#APP SERVICE PLAN
app_service_plan_variables = {
  "app_service_plan_1" = {
    name                             = "ploceusappplan000001"
    resource_group_name              = "ploceus"
    location                         = "westus2"
    kind                             = "Windows"
    maximum_elastic_worker_count     = null
    reserved                         = false
    app_service_environment_required = false
    app_service_environment_name     = null
    sku_tier                         = "Standard"
    sku_size                         = "S1"
    sku_capacity                     = 1
    per_site_scaling                 = false
    app_service_plan_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

#STORAGE ACCOUNT
storage_account_variables = {
  "storage_account_1" = {
    name                              = "ploceussa000001"
    resource_group_name               = "ploceus"
    location                          = "westus2"
    account_tier                      = "Standard"
    account_replication_type          = "LRS"
    account_kind                      = "StorageV2"
    access_tier                       = "Hot"
    enable_https_traffic_only         = true
    min_tls_version                   = "TLS1_2"
    allow_blob_public_access          = true
    large_file_share_enabled          = false
    blob_retention_policy             = 1
    container_delete_retention_policy = 1
    nfsv3_enabled                     = false
    is_hns_enabled                    = false #This can only be true when account_tier is Standard or Premium and account_kind is BlockBlobStorage
    storage_account_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

#FUNCTION APP
function_app_variables = {
  "function_app_1" = {
    name                    = "ploceusfuncapp000001"
    resource_group_name     = "ploceus"
    location                = "westus2"
    client_affinity_enabled = false
    client_cert_mode        = null #"Optional" #"Required"
    enabled                 = true
    enable_builtin_logging  = true
    https_only              = false
    os_type                 = null
    storage_account_name    = "ploceussa000001"
    version                 = "~1"
    app_service_plan_name   = "ploceusappplan000001"
    identity_type           = "SystemAssigned"
    #identity_identity_ids         = []
    site_config_always_on         = false
    site_config_ftps_state        = "Disabled"
    site_config_health_check_path = null
    site_config_http2_enabled     = false
    #    site_config_ip_restriction    = []
    site_config_min_tls_version           = 1.2
    site_config_use_32_bit_worker_process = true
    function_app_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  },
  "function_app_2" = {
    name                    = "ploceusfuncapp000002"
    resource_group_name     = "ploceus"
    location                = "westus2"
    client_affinity_enabled = false
    client_cert_mode        = null #"Optional" #"Required"
    enabled                 = true
    enable_builtin_logging  = true
    https_only              = false
    os_type                 = null
    storage_account_name    = "ploceussa000001"
    version                 = "~1"
    app_service_plan_name   = "ploceusappplan000001"
    identity_type           = "SystemAssigned"
    #identity_identity_ids         = []
    site_config_always_on         = false
    site_config_ftps_state        = "Disabled"
    site_config_health_check_path = null
    site_config_http2_enabled     = false
    #    site_config_ip_restriction    = []
    site_config_min_tls_version           = 1.2
    site_config_use_32_bit_worker_process = true
    function_app_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

#KEY VAULT
key_vault_variables = {
  "key_vault_1" = {
    name                            = "ploceuskeyvault000004"
    location                        = "westus2"
    resource_group_name             = "ploceus"
    enabled_for_disk_encryption     = true
    enabled_for_deployment          = true
    enabled_for_template_deployment = true
    enable_rbac_authorization       = true
    soft_delete_retention_days      = "7"
    purge_protection_enabled        = false
    sku_name                        = "standard"
    key_permissions                 = []
    secret_permissions              = []
    storage_permissions             = []
    key_vault_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

#FUNCTION APP TO KEY VAULT ROLE ASSIGNMENT
function_keyvault_role_assignment_variables = {
  "function_keyvault_role_assignment_1" = {
    role_definition_name = "Key Vault Secrets User"
    resource_group_name  = "ploceus"
    key_vault_name       = "ploceuskeyvault000004"
  }
}
