#LOAD BALANCER RULES
variable "load_balancer_rule_variables" {
  type = map(object({
    load_balancer_name                                = string
    load_balancer_resource_group_name                 = string
    load_balancer_subscription_id                     = string # Mark as null if load_balancer_rule_probe_name is null
    load_balancer_rule_name                           = string
    load_balancer_rule_protocol                       = string
    load_balancer_rule_frontend_port                  = string
    load_balancer_rule_backend_port                   = string
    load_balancer_rule_frontend_ip_configuration_name = string
    load_balancer_rule_backend_pool_names             = list(string)
    load_balancer_rule_probe_name                     = string # Optional, mark as null if not needed
    load_balancer_rule_load_distribution              = string
    load_balancer_rule_idle_timeout_in_minutes        = number
    load_balancer_rule_enable_floating_ip             = bool
    load_balancer_rule_disable_outbound_snat          = bool
    load_balancer_rule_enable_tcp_reset               = bool
  }))
  description = "Map containing load balancer rule and probe parameters"
  default     = {}
}
