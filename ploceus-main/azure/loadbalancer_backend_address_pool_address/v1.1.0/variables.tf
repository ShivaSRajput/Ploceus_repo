variable "loadbalancer_backend_address_pool_address" {
  type = map(object({
    name        = string
    ip_address  = string
    lb_name     = string
    lb_rgname   = string
    vnet_rgname = string
  }))
}
