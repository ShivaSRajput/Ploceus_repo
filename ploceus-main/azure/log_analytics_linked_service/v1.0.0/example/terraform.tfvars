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

#AUTOMATION ACCOUNT VARIABLES
automation_account_variables = {
  "automation_account_1" = {
    identity_type       = "SystemAssigned"
    location            = "westus2"
    name                = "ploceusautomationaccount00001"
    resource_group_name = "ploceusrg000001"
    sku_name            = "Basic"
    user_identity_name  = null
    automation_account_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

#LOG ANALYTICS WORKSPACE
log_analytics_workspace_variables = {
  "log_analytics_workspace_1" = {
    name                               = "ploceuslog000001" #Required
    location                           = "westus2"          #Required
    resource_group_name                = "ploceusrg000001"  #Required
    sku                                = "PerGB2018"        #Optional
    retention_in_days                  = null               #Optional
    daily_quota_gb                     = null               #Optional
    internet_ingestion_enabled         = null               #Optional
    internet_query_enabled             = null               #Optional
    reservation_capacity_in_gb_per_day = null               #Optional
    log_analytics_workspace_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

#LOG ANALYTICD LINKED SERVICE
log_analytics_linked_service_variables = {
  "log_analytics_linked_service_1" = {
    resource_group_name          = "ploceusrg000001"
    location                     = "westus2"
    automation_account_name      = "ploceusautomationaccount00001"
    sku_name                     = "Basic"
    log_analytics_workspace_name = "ploceuslog000001"
    sku                          = "PerGB2018"
    law_retention_in_days        = null # Log Analytics WOrkspace Retention in days
  }
}
