resource "azurerm_express_route_circuit_authorization" "express_route_circuit_authorization" {
  for_each                   = var.express_route_circuit_authorization_variables
  name                       = each.value.express_route_circuit_authorization_name
  express_route_circuit_name = each.value.express_route_circuit_authorization_express_route_circuit_name
  resource_group_name        = each.value.express_route_circuit_authorization_resource_group_name
}