#Subnet Variables
variable "subnet_variables" {
  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))
  default = {}
}

#VNET variable
variable "vnets_variables" {
  description = "Map of vnet objects. name, vnet_address_space, and dns_server supported"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    dns_servers         = list(string)

    is_ddos_protection_required = bool
    ddos_protection_plan_name   = string
    vnet_tags                   = map(string)
  }))
  default = {}
}

#RESOURCE GROUP VARIABLES
variable "resource_group_variables" {
  description = "Map of Resource groups"
  type = map(object({
    name                = string
    location            = string
    resource_group_tags = map(string)
  }))
  default = {}
}

#LOAD BALANCER RULES
variable "load_balancer_rules" {
  type = map(object({
    name                      = string
    lb_name                   = string
    lb_rgname                 = string
    frontend_ip_name          = string
    backend_pool_name         = string
    lb_protocol               = string
    lb_port                   = string
    backend_port              = number
    enable_floating_ip        = bool
    disable_outbound_snat     = bool
    enable_tcp_reset          = bool
    probe_port                = number
    probe_protocol            = string
    request_path              = string
    probe_interval            = number
    probe_unhealthy_threshold = number
    load_distribution         = string
    idle_timeout_in_minutes   = number
  }))
  description = "Map containing load balancer rule and probe parameters"
  default     = {}
}

#LOAD BALANCER
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

#LOAD BALANCER BACKENDPOOLS
variable "load_balancer_backendpools" {
  type = map(object({
    name      = string
    lb_name   = string
    lb_rgname = string
  }))
  description = "Map containing load balancer backend address pools"
  default     = {}
}