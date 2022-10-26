variable "load_balancer_backendpools" {
  type = map(object({
    name      = string
    lb_name   = string
    lb_rgname = string
  }))
  description = "Map containing load balancer backend address pools"
  default     = {}
}