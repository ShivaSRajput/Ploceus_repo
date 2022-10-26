output "loadbalancer_backendpool_ids" {
  value       = { for k, v in var.load_balancer_backendpools : k => azurerm_lb_backend_address_pool.this[k].id }
  description = "Id's of Loadbalancer backendpools"
}