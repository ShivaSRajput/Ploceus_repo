variable "load_balancers" {
  type = map(object({
    name                   = string
    sku                    = string
    lb_resource_group_name = string
    frontend_ip_config = list(object({
      name              = string
      subnet_name       = string
      vnet_name         = string
      static_ip         = string
      availability_zone = string
    }))
    lb_tags        = map(string)
    public_ip_name = string
  }))
  description = "Map containing load balancers"
  default     = {}
}