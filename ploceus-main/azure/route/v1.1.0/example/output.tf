#Output Route Table
output "route" {
  value       = module.route.route
  description = "Route Outputs"
}