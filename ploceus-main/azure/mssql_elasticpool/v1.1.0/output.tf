output "mssql_elasticpool_ids" {
  value       = { for k, v in azurerm_mssql_elasticpool.mssql_elasticpool : k => v.id }
  description = "mssql elasticpool id"
}
