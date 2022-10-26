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
module "sentinel_data_connector_office_365" {
  source                                       = "../"
  sentinel_data_connector_office_365_variables = var.sentinel_data_connector_office_365_variables
  depends_on = [
    module.resource_group, module.log_analytics_workspace
  ]
}
