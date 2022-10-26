#RESOURCE GROUP VARIABLES
variable "resource_group_variables" {
  description = "Map of Resource groups"
  type = map(object({
    name                = string
    location            = string
    resource_group_tags = map(string)
  }))
  default = {}
}

#LOG ANALYTICS WORKSPACE VARIABLE
variable "log_analytics_workspace_variables" {
  type = map(object({
    name                               = string
    location                           = string
    resource_group_name                = string
    sku                                = string
    retention_in_days                  = number
    daily_quota_gb                     = number
    internet_ingestion_enabled         = bool
    internet_query_enabled             = bool
    reservation_capacity_in_gb_per_day = number
    log_analytics_workspace_tags       = map(string)
  }))
}

#sentinel watchlist variables
variable "sentinel_watchlist_variables" {
  type = map(object({
    log_analytics_workspace_name                = string
    log_analytics_workspace_resource_group_name = string
    sentinel_watchlist_name                     = string
    sentinel_watchlist_display_name             = string
    item_search_key                             = string
    description                                 = string
    labels                                      = list(string)
    default_duration                            = string
  }))
}
