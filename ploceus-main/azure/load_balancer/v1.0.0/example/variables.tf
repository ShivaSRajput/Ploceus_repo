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
