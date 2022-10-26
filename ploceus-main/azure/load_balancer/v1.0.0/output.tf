output "loadbalancer_ids" {
  value       = { for k, v in var.load_balancers : k => azurerm_lb.this[k].id }
  description = "Id's of Loadbalancers"
}