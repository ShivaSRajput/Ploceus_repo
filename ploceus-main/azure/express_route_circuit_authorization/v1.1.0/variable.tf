variable "express_route_circuit_authorization_variables" {
  type = map(object({
    express_route_circuit_authorization_name                       = string
    express_route_circuit_authorization_express_route_circuit_name = string
    express_route_circuit_authorization_resource_group_name        = string
  }))
}