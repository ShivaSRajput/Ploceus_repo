output "traffic_manager_endpoint_ids" {
 value       = { for k, v in var.traffic_manager_endpoint_variables : k => azurerm_traffic_manager_azure_endpoint.traffic_manager_endpoint[k].id }
}
