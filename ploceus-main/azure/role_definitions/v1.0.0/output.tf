output "tf_role_definition_id" {
    value = { for k,v in azurerm_role_definition.role_definition : k => v.id }
    
}

output "role_definition_id" {
    value = { for k,v in azurerm_role_definition.role_definition : k => v.role_definition_id  }
}

output "role_definition_resource_id" {
    value = { for k,v in azurerm_role_definition.role_definition : k => v.role_definition_resource_id }
}