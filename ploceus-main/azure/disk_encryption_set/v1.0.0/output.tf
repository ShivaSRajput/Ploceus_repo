output "disk_encryption_set_id" {
  value = { for k, v in azurerm_disk_encryption_set.disk_encryption_set : k => v.id }
}

# output "disk_encryption_set_principal_id" {
#   description = "System Assigned Principal ID"
#   value       = flatten([for x in azurerm_disk_encryption_set.disk_encryption_set : [for y in x.identity : y.principal_id]])
# }

# output "disk_encryption_set_principal_id" {
#   description = "System Assigned Principal ID"
#   value       = [for x in azurerm_disk_encryption_set.disk_encryption_set : [for y in x.identity : y.principal_id]]
# }

output "disk_encryption_set_principal_id" {
  description = "System Assigned Principal ID"
  value       = { for k, x in azurerm_disk_encryption_set.disk_encryption_set : k => [for y in x.identity : y.principal_id] }
}

# output "disk_encryption_set_tenant_id" {
#   description = "System Assigned Tenant ID"
#   value       = flatten([for x in azurerm_disk_encryption_set.disk_encryption_set : [for y in x.identity : y.tenant_id]])
# }

output "disk_encryption_set_tenant_id" {
  description = "System Assigned Principal ID"
  value       = { for k, x in azurerm_disk_encryption_set.disk_encryption_set : k => [for y in x.identity : y.tenant_id] }
}