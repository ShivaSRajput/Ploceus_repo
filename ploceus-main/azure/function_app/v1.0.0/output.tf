# output "function_app_principle_id" {
#   value = { for k, v in azurerm_function_app.function_app : k => v.principal_id }
# }

output "function_app_principle_id" {
  description = "System Assigned Principal ID"
  value       = flatten([for x in azurerm_function_app.function_app : [for y in x.identity : y.principal_id]])
}