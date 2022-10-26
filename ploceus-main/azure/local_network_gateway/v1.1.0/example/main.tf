#RESOURCE GROUP
module "resource_group" {
  source                   = "../../../resource_group/v1.0.0"
  resource_group_variables = var.resource_group_variables
}


#Local Network Gateway
module "local_network_gateway" {
  source                          = "../"
  local_network_gateway_variables = var.local_network_gateway_variables
  depends_on                      = [module.resource_group]
}








