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
