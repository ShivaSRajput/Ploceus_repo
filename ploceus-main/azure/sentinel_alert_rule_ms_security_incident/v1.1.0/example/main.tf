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
module "sentinel_alert_rule_ms_security_incident" {
  source                                             = "../"
  sentinel_alert_rule_ms_security_incident_variables = var.sentinel_alert_rule_ms_security_incident_variables
  depends_on = [
    module.resource_group, module.log_analytics_workspace
  ]
}
