#RESOURCE GROUP
module "resource_group" {
  source                   = "../../../resource_group/v1.1.0"
  resource_group_variables = var.resource_group_variables
}

module "log_analytics_workspace" {
  source                            = "../../../log_analytics_workspace/v1.1.0"
  log_analytics_workspace_variables = var.log_analytics_workspace_variables
  depends_on                        = [module.resource_group]
}

module "security_centre_automation" {
  source                               = "../"
  security_centre_automation_variables = var.security_centre_automation_variables
  depends_on                           = [module.log_analytics_workspace]

}
