#RESOURCE GROUP
module "resource_group" {
  source                   = "../../../resource_group/v1.0.0"
  resource_group_variables = var.resource_group_variables
}

#AUTOMATION ACCOUNT
module "automation_account" {
  source                       = "../../../automation_account/v1.0.0"
  automation_account_variables = var.automation_account_variables
  depends_on                   = [module.resource_group]
}

#LOG ANALYTICS WORKSPACE
module "log_analytics_workspace" {
  source                            = "../../../log_analytics_workspace/v1.0.0"
  log_analytics_workspace_variables = var.log_analytics_workspace_variables
  depends_on                        = [module.resource_group]
}

#LOG ANALYTICS LINKED SERVICE
module "log_analytics_linked_service" {
  source                                 = "../"
  log_analytics_linked_service_variables = var.log_analytics_linked_service_variables
  depends_on                             = [module.resource_group, module.automation_account, module.log_analytics_workspace]
}
