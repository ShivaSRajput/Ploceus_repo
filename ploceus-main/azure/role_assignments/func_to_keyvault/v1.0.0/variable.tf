#FUNCTION APP TO KEY VAULT ROLE ASSIGNMENT
variable "function_keyvault_role_assignment_variables" {
  type = map(object({
    role_definition_name = string
    resource_group_name  = string
    key_vault_name       = string
  }))
}

variable "function_app_principal_id" {
  description = "Principal ID of the System Assigned Managed Identity"
}