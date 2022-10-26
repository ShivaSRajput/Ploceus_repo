#Output Route Table
output "route_tables" {
  value       = azurerm_route_table.route_table
  description = "Route Table Outputs"
}