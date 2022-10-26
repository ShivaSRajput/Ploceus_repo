output "loadbalancer_rule_ids" {
  value       = { for k, v in var.load_balancer_rule_variables : k => azurerm_lb_rule.load_balancer_rule[k].id }
  description = "Id's of Loadbalancer rules"
}