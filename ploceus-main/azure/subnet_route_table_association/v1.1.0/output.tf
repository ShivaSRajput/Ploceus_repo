#Output Subnet -> Route Table Association
output "subnet_route_table_association" {
  value       = azurerm_subnet_route_table_association.subnet_route_table_association
  description = "Subnet ID Associated"
}