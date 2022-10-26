output "express_route_circuit_id" {
  value = { for k, v in azurerm_express_route_circuit.express_route_circuit : k => v.id }
}

