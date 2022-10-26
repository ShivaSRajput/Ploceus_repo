variable "lb_natpools" {
  type = map(object({
    name                           = string
    load_balancer_name             = string
    resource_group_name            = string
    frontend_ip_configuration_name = string
    protocol                       = string
    frontend_port_start            = number
    frontend_port_end              = number
    backend_port                   = number
    idle_timeout_in_minutes        = number
    floating_ip_enabled            = bool
    tcp_reset_enabled              = bool
  }))
  description = "Map containing load balancer nat pools"
  default     = {}
}