# RESOURCE GROUP
module "resource_group" {
  source                   = "../../../resource_group/v1.1.0"
  resource_group_variables = var.resource_group_variables
}

#Log Analytics Workspace
module "log_analytics_workspace" {
  source                            = "../../../log_analytics_workspace/v1.1.0"
  log_analytics_workspace_variables = var.log_analytics_workspace_variables
  depends_on                        = [module.resource_group]
}
module "sentinel_watchlist" {
  source                       = "../../../sentinel_watchlist/v1.1.0"
  sentinel_watchlist_variables = var.sentinel_watchlist_variables
  depends_on = [
    module.log_analytics_workspace
  ]
}
module "sentinel_watchlist_item" {
  source                            = "../"
  sentinel_watchlist_item_variables = var.sentinel_watchlist_item_variables
  depends_on = [
    module.resource_group, module.log_analytics_workspace
  ]
}
