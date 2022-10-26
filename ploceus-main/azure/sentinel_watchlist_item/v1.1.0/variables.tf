#sentinel watchlist item variables
variable "sentinel_watchlist_item_variables" {
  type = map(object({
    log_analytics_workspace_name                = string
    log_analytics_workspace_resource_group_name = string
    sentinel_watchlist_item_name                = string
    sentinel_watchlist_name                     = string
    properties                                  = map(string)
  }))
}
