output "application_gateway_ids" {
  value = [for x in azurerm_application_gateway.application_gateway : x.id]
}

output "application_gateway_ids_map" {
  value = { for x in azurerm_application_gateway.application_gateway : x.name => x.id }
}
