#APPLICATION INSIGHTS (Mandatory module for ML)
application_insights_variables = {
  application_insights_1 = {
    name                = "applicationinsights000001"
    resource_group_name = "ploceus"
    location            = "eastus"
    application_type    = "web"
    retention_in_days   = 90
    disable_ip_masking  = false
    application_insights_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

#STORAGE ACCOUNT (Mandatory module for ML)
storage_account_variables = {
  "storage_account_1" = {
    name                              = "ploceussa000001"
    resource_group_name               = "ploceus"
    location                          = "eastus"
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

#KEY VAULT (Mandatory module for ML)
key_vault_variables = {
  "key_vault_1" = {
    name                            = "ploceuskeyvault000002"
    location                        = "eastus"
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

#CONTAINER REGISTRY is an optional module for Machine Learning. Uncomment lines from 67 to 85 only if required
#If using CONTAINER REGISTRY also uncomment lines ( 56 to 71) from variables.tf inside example folder
#Also uncomment lines 23 to 26 and 35 from main.tf inside example folder

#CONTAINER REGISTRY (Optional module for ML)
# container_registry_variables = {
#   "container_registry_1" = {
#     name                     = "ploceusacr000001"
#     location                 = "eastus"
#     resource_group_name      = "ploceus"
#     sku                      = "Standard"
#     admin_enabled            = true #Must be enabled for ML
#     georeplication_locations = null #Only works for Premium sku 
#     # public_network_access_enabled  = true
#     # quarantine_policy_enabled      = false
#     retention_policy_enabled = false #Only works for Premium sku 
#     retention_policy_days    = "7"   #Only works for Premium sku 
#     trust_policy_enabled     = false #Only works for Premium sku 
#     container_registry_tags = {
#       Created_By = "Ploceus",
#       Department  = "CIS"
#     }
#   }
# }


#MACHINE LEARNING (Mandatory module for ML)
machine_learning_variables = {
  "machine_learning_1" = {
    name                           = "ploceusmlworkspace000001"
    location                       = "eastus"
    resource_group_name            = "ploceus"
    sku_name                       = "Basic"
    application_insights_name      = "applicationinsights000001"
    key_vault_name                 = "ploceuskeyvault000001"
    storage_account_name           = "ploceussa000001"
    is_container_registry_required = false #Provide as true if CONTAINER REGISTRY is required
    container_registry_name        = null  #Provide the name of the CONTAINER REGISTRY if above value is true
    high_business_impact           = false
    machine_learning_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  },
  "machine_learning_2" = {
    name                           = "ploceusmlworkspace000002"
    location                       = "eastus"
    resource_group_name            = "ploceus"
    sku_name                       = "Basic"
    application_insights_name      = "applicationinsights000001"
    key_vault_name                 = "ploceuskeyvault000001"
    storage_account_name           = "ploceussa000001"
    is_container_registry_required = true               #Provide as true if CONTAINER REGISTRY is required
    container_registry_name        = "ploceusacr000001" #Provide the name of the CONTAINER REGISTRY if above value is true
    high_business_impact           = false
    machine_learning_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}
