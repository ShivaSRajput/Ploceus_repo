output "loadbalancer_natpool_ids" {
  value       = { for k, v in var.lb_natpools : k => azurerm_lb_nat_pool.lb_nat_pool[k].id }
  description = "Id's of Loadbalancer Nat Pools"
}