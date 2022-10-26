#Output Subnet -> Route Table Association
output "route_table" {
  value       = module.subnet_route_table_association.subnet_route_table_association
  description = "Subnet ID Associated"
}