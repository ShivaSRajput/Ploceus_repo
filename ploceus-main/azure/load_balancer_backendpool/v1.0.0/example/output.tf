output "loadbalancer_backendpool_ids" {
  value       = module.load_balancer_backendpools.loadbalancer_backendpool_ids
  description = "Id's of Loadbalancer backendpools"
}