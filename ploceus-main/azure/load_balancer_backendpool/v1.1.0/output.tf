output "loadbalancer_backendpool_ids" {
  value       = { for k, v in var.load_balancer_backendpool_variables : k => azurerm_lb_backend_address_pool.backend_address_pool[k].id }
  description = "Id's of Loadbalancer backendpools"
}