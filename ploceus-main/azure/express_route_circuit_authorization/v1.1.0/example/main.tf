#RESOURCE GROUP MODULE
module "resource_group" {
  source                   = "../../../resource_group/v1.1.0"
  resource_group_variables = var.resource_group_variables
}

#EXPRESS ROUTE CIRCUIT MODULE
module "express_route_circuit" {
  source                          = "../../../express_route_circuit/v1.1.0"
  express_route_circuit_variables = var.express_route_circuit_variables
  depends_on                      = [module.resource_group]
}

#EXPRESS ROUTE CIRCUIT PEERING MODULE
module "express_route_circuit_authorization" {
  source                                        = "../"
  express_route_circuit_authorization_variables = var.express_route_circuit_authorization_variables
  depends_on                                    = [module.express_route_circuit]
}