#Resource Group
module "resource_group" {
  source                   = "../../../resource_group/v1.1.0"
  resource_group_variables = var.resource_group_variables
}

#LOG ANALYTICS WORKSPACE
module "log_analytics_workspace" {
  source                            = "../../../log_analytics_workspace/v1.1.0"
  log_analytics_workspace_variables = var.log_analytics_workspace_variables
  depends_on                        = [module.resource_group]
}

#Firewall Policies
module "firewall_policy" {
  source                    = "../../../firewall-policies/v1.1.0"
  firewall_policy_variables = var.firewall_policy_variables
  depends_on = [
    module.log_analytics_workspace
  ]
}
#firewall Policies Rule Collection Group
module "firewall_policy_rule_collection_group" {
  source                                          = "../../../firewall_policy_rule_collection_group/v1.1.0"
  firewall_policy_rule_collection_group_variables = var.firewall_policy_rule_collection_group_variables
  depends_on = [
    module.firewall_policy
  ]
}
