#resource group variables
resource_group_variables  = {
  "resource_group_1"      = {
    name                  = "ploceusrg000001"
    location              = "westus2"
    resource_group_tags   = {
      Created_By          = "Ploceus",
      Department          = "CIS"
    }
  }
}



# STORAGE ACCOUNT
storage_account_variables             = {
  "storage_account_1"                 = {
    name                              = "ploceussa0000012"
    resource_group_name               = "ploceusrg000001"
    location                          = "westus2"
    account_tier                      = "Standard"
    account_replication_type          = "LRS"
    account_kind                      = "StorageV2"
    access_tier                       = "Hot"
    enable_https_traffic_only         = true
    min_tls_version                   = "TLS1_2"
    allow_nested_items_to_be_public   = true
    large_file_share_enabled          = false
    is_hns_enabled                    = true  #This can only be true when account_tier is Standard or Premium and account_kind is BlockBlobStorage
    nfsv3_enabled                     = false #This can only be true when account_tier is Standard and account_kind is StorageV2, or account_tier is Premium and account_kind is BlockBlobStorage. Additionally, the is_hns_enabled is true, and enable_https_traffic_only is false.
    cross_tenant_replication_enabled  = true
    shared_access_key_enabled         = true
    queue_encryption_key_type         = "service" #is only allowed when the account_kind is set to StorageV2.
    table_encryption_key_type         = "service" #is only allowed when the account_kind is set to StorageV2.
    edge_zone                         = null
    infrastructure_encryption_enabled = true #This can only be true when account_kind is StorageV2 or when account_tier is Premium and account_kind is BlockBlobStorage.
    custom_domain                     = null

    routing                           = []

    azure_files_authentication        = null
    identity                          = null
    customer_managed_key              = null
    custom_domain                     = null


    network_rules                     = []

    share_properties                  = []

    queue_properties                  = []


    blob_properties                   = []


    static_website                    = {
      index_path                      = "index.html"
      custom_404_path                 = "404.html"
    }

    storage_account_tags              = {
      Created_By                      = "Ploceus",
      Department                      = "CIS"
    }
  }
}


#datalake gen2 filesystem varibales
storage_data_lake_gen2_filesystem_variable = {
  "filesystem_1"                        = {

    filesystem_name                     = "ploceusfs000001"
    storage_account_name                = "ploceussa0000012"
    storage_account_resource_group_name = "ploceusrg000001"
    filesystem_owner                    = null  #if you have user in azure active directory you need to mention the object id inplace of null
    filesystem_group                    = null #if you have group in azure active directory you need to mention the object id inplace of null
    properties                          = {
      key                               = "aGVsbG8="
    }
    ace = [{
      permissions                       = "rwx"
      scope                             = "access"
      type                              = "group"
      id                                = null #if you have user or group in azure active directory you need to mention the object id inplace of null

    }]
  }
}

