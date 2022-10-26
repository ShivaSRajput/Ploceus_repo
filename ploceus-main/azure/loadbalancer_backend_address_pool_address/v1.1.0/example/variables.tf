#Subnet Variables
variable "subnet_variables" {
  type = map(object({
    name                                           = string
    resource_group_name                            = string
    virtual_network_name                           = string
    address_prefixes                               = list(string)
    enforce_private_link_service_network_policies  = bool
    enforce_private_link_endpoint_network_policies = bool
    service_endpoints                              = list(string)
    is_delegetion_required                         = bool
    delegation_name                                = string
    service_name                                   = string
    service_actions                                = list(string)
  }))
  default = {}
}


#VNET variable
variable "vnets_variables" {
  description = "Map of vnet objects. name, vnet_address_space, and dns_server supported"
  type = map(object({
    name                        = string
    location                    = string
    resource_group_name         = string
    address_space               = list(string)
    dns_servers                 = list(string)
    flow_timeout_in_minutes     = number
    bgp_community               = string
    is_ddos_protection_required = bool
    ddos_protection_plan_name   = string
    vnet_tags                   = map(string)
    edge_zone                   = string
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

variable "load_balancers" {
  type = map(object({
    name                   = string
    location               = string
    sku                    = string
    sku_tier               = string
    lb_resource_group_name = string
    frontend_ip_config = list(object({
      name        = string
      subnet_name = string
      vnet_name   = string
      static_ip   = string
      zones       = set(string)
    }))
    lb_tags        = map(string)
    public_ip_name = string
  }))
  description = "Map containing load balancers"
  default     = {}
}

variable "load_balancer_backendpools" {
  type = map(object({
    name      = string
    lb_name   = string
    lb_rgname = string
  }))
  description = "Map containing load balancer backend address pools"
  default     = {}
}
variable "loadbalancer_backend_address_pool_address" {
  type = map(object({
    name        = string
    ip_address  = string
    lb_name     = string
    lb_rgname   = string
    vnet_rgname = string
  }))
}
