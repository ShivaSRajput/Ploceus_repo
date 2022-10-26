output "user_assigned_identity_id" {
  value = { for k, v in azurerm_user_assigned_identity.user_assigned_identity : k => v.id }
}
