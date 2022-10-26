output "nsg_rule_ids" {
  value       = module.network_security_group_rules.nsg_rule_ids
  description = "NSG Rule Id's"
}