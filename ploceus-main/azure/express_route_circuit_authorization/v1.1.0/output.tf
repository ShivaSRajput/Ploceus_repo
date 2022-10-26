output "express_route_circuit_authorization_outputs" {
  value = [
    for k, v in var.express_route_circuit_authorization_variables :
    {
      id                       = azurerm_express_route_circuit_authorization.express_route_circuit_authorization[k].id
      authorization_key        = azurerm_express_route_circuit_authorization.express_route_circuit_authorization[k].authorization_key
      authorization_use_status = azurerm_express_route_circuit_authorization.express_route_circuit_authorization[k].authorization_use_status
    }
  ]
  description = "Express route circuit authorization values"
}