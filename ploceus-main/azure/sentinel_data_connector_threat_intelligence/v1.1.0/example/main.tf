
#RESOURCE GROUP
module "resource_group" {
  source                   = "../../../resource_group/v1.0.0"
  resource_group_variables = var.resource_group_variables
}

#Log Analytics Workspace
module "log_analytics_workspace" {
  source                            = "../../../log_analytics_workspace/v1.1.0"
  log_analytics_workspace_variables = var.log_analytics_workspace_variables
  depends_on                        = [module.resource_group]
}
#sentinel data connector threat intelligence
module "sentinel_data_connector_threat_intelligence" {
  source                                                = "../"
  sentinel_data_connector_threat_intelligence_variables = var.sentinel_data_connector_threat_intelligence_variables
  depends_on = [
    module.resource_group, module.log_analytics_workspace
  ]
}
