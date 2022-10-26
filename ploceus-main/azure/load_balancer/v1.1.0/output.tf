output "load_balancer_ids" {
  value       = { for k, v in azurerm_lb.load_balancers : k => v.id }
  description = "Id's of Loadbalancers"
}
