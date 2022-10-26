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

#sentinel watchlist variables
sentinel_watchlist_variables = {
  "sentinel_watchist_1" = {
    log_analytics_workspace_name                = "ploceuslog000001"
    log_analytics_workspace_resource_group_name = "ploceusrg000001"
    sentinel_watchlist_name                     = "ploceussentinelwatchlist000001"
    sentinel_watchlist_display_name             = "sentinelwatchlist000001"
    item_search_key                             = "ploceus"
    description                                 = "ploceussentinelwatchlist"
    labels                                      = ["Ploceus", "CIS"]
    default_duration                            = "P10M"
  }
}
