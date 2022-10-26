#RESOURCE GROUP 
resource_group_variables = {
  "resource_group_1" = {
    name     = "ploceusrg000001"
    location = "westus2"
    resource_group_tags = {
      Created_By = "ploceus",
      Department = "CIS"
    }
  }
}

recovery_service_vault_variable = {
  "recovery_service_vault_1" = {
    name                         = "ploceusrsv000001"
    resource_group_name          = "ploceusrg000001"
    sku                          = "Standard"
    location                     = "westus2"
    soft_delete_enabled          = true
    identity                     = null
    storage_mode_type            = null
    cross_region_restore_enabled = null #make it true only when storage_mode_type="GeoRedundant"
    encryption                   = null
    tags = {
      Created_By = "ploceus"
    }
    lock_level                   = "CanNotDelete" # and ReadOnly are the 2 options
    notes                        = "Locked by Neudesic"
  },
  "recovery_service_vault_2" = {
    name                         = "ploceusrsv000002"
    sku                          = "Standard"
    resource_group_name          = "ploceusrg000001"
    location                     = "westus2"
    soft_delete_enabled          = true
    identity                     = null
    storage_mode_type            = null
    cross_region_restore_enabled = null #make it true only when storage_mode_type="GeoRedundant"
    encryption                   = null
    tags = {
      Created_By = "ploceus"
    }
    lock_level                   = "CanNotDelete" # and ReadOnly are the 2 options
    notes                        = "Locked by Neudesic"
  }
}