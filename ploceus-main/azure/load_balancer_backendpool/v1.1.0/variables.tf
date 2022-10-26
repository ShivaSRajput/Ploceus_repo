variable "load_balancer_backendpool_variables" {
  type = map(object({
    load_balancer_backendpool_name                      = string
    load_balancer_name                                  = string
    load_balancer_resource_group_name                   = string
    load_balancer_backendpool_tunnel_interface_required = bool
    load_balancer_backendpool_tunnel_interface_variables = map(object({
      load_balancer_backendpool_tunnel_interface_identifier = string
      load_balancer_backendpool_tunnel_interface_type       = string
      load_balancer_backendpool_tunnel_interface_protocol   = string
      load_balancer_backendpool_tunnel_interface_port       = string
    }))
  }))
  description = "Map containing load balancer backend address pools"
  default     = {}
}