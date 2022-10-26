output "loadbalancer_rule_ids" {
  value       = { for k, v in var.load_balancer_rules : k => azurerm_lb_rule.this[k].id }
  description = "Id's of Loadbalancer rules"
}