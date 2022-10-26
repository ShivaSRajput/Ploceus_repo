output "load_balancer_probe_ids" {
  value       = { for k, v in azurerm_lb_probe.load_balancer_probe : k => v.id }
  description = "Id's of Loadbalancer Probe"
}