output "security_center_workspace_ids" {
  description = "security centre workspace outputs"
  value = [
    for k, v in azurerm_security_center_workspace.security_centre_workspace :
    {
      k = v.id
    }
  ]
}

