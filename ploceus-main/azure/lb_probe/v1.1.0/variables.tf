variable "load_balancer_probe_variables" {
  type = map(object({
    load_balancer_name                      = string
    load_balancer_resource_group_name       = string
    load_balancer_probe_name                = string
    load_balancer_probe_port                = number
    load_balancer_probe_protocol            = string
    load_balancer_probe_request_path        = string
    load_balancer_probe_interval            = number
    load_balancer_probe_unhealthy_threshold = number
  }))
}