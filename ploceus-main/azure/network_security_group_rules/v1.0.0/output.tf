output "nsg_rule_ids" {
  value       = { for k, v in var.network_security_group_rules_variable : k => azurerm_network_security_rule.azurerm_network_security_rule[k].id }
  description = "NSG Id's"
}