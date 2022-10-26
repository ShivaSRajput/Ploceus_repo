output "postgresql_firewall_rule_ids" {
  value = { for k, v in azurerm_postgresql_firewall_rule.postgresql_firewall_rule : k => v.id }
}