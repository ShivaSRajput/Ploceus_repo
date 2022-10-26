#RESOURCE GROUP
module "resource_group" {
  source                   = "../../../resource_group/v1.0.0"
  resource_group_variables = var.resource_group_variables
}

#LOG ANALYTICS WORKSPACE
module "log_analytics_workspace" {
  source                            = "../../../log_analytics_workspace/v1.1.0"
  log_analytics_workspace_variables = var.log_analytics_workspace_variables
  depends_on                        = [module.resource_group]
}

#LOG ANALYTICS SOLUTION
module "log_analytics_solution" {
  source                           = "../"
  log_analytics_solution_variables = var.log_analytics_solution_variables
  depends_on                       = [module.resource_group,module.log_analytics_workspace]
}