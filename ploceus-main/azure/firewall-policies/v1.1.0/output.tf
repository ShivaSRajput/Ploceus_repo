
output "azurerm_firewall_policy" {
  value       = { for k, v in azurerm_firewall_policy.firewall_policy : k => v.id }
  description = "Azure firewall polcies"
}