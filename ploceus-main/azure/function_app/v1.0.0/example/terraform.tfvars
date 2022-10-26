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

#APP SERVICE PLAN
app_service_plan_variables = {
  "app_service_plan_1" = {
    name                             = "ploceusappplan000003"
    resource_group_name              = "ploceusrg000001"
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
    resource_group_name               = "ploceusrg000001"
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
    name                    = "ploceusfuncapp000003"
    resource_group_name     = "ploceusrg000001"
    location                = "westus2"
    client_affinity_enabled = false
    client_cert_mode        = null #"Optional" #"Required"
    enabled                 = true
    enable_builtin_logging  = true
    https_only              = false
    os_type                 = null
    storage_account_name    = "ploceussa000001"
    version                 = "~1"
    app_service_plan_name   = "ploceusappplan000003"
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
