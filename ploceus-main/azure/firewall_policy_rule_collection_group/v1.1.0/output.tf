
output "firewall_policy_rule_collection_group_id" {
  value       = { for k, v in azurerm_firewall_policy_rule_collection_group.firewall_policy_rule_collection_group : k => v.id }
  description = "Azure firewall policy rule collection group id"
}
