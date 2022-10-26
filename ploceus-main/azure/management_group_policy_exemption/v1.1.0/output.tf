output "management_group_policy_exemption_id" {
  description = "Management Group policy exemption output id"
  value       = { for k, v in azurerm_management_group_policy_exemption.management_group_policy_exemption : k => v.id }
}