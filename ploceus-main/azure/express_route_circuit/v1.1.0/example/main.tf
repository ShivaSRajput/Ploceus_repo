module "resource_group" {
  source                   = "../../../resource_group/v1.1.0"
  resource_group_variables = var.resource_group_variables
}
module "express_route_circuit" {
  source                          = "../"
  express_route_circuit_variables = var.express_route_circuit_variables
  depends_on      = [module.resource_group]
}