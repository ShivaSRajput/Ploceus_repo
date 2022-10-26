#Output PostgreSql Firewall Rule
output "postgresql_firewall_rule_ids" {
  value       = module.postgresql_firewall_rule.postgresql_firewall_rule_ids
  description = "PostgreSql firewall Rule Output"
}