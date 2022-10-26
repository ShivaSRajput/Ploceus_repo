#RESOURCE GROUP
module "resource_group" {
  source                   = "../../../resource_group/v1.1.0"
  resource_group_variables = var.resource_group_variables
}

#WEB_APPLICATION_FIREWALL_POLICY
module "web_application_firewall_policy" {
  source                                    = "../"
  web_application_firewall_policy_variables = var.web_application_firewall_policy_variables
  depends_on                                = [module.resource_group]
}
