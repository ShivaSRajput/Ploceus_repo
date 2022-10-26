output "loadbalancer_backend_address_pool_address_ids" {
  value       = { for k, v in var.loadbalancer_backend_address_pool_address : k => azurerm_lb_backend_address_pool_address.address_pool_address[k].id }
  description = "Id's of Loadbalancer backend address pools"
}
