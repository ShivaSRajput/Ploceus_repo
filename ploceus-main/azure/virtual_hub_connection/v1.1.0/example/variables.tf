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

#VNET variable   #Uncomment the below lines if Vnet creation is required 
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

variable "virtual_wan_variables" {
  type = map(object({
    name                              = string
    resource_group_name               = string
    location                          = string
    disable_vpn_encryption            = bool   #Optional; can be null which defaults to false
    allow_branch_to_branch_traffic    = bool   #Optional; can be null which defaults to true
    type                              = string #Optional; can be null which defaults to Standard
    office365_local_breakout_category = string #Optional; can be null which defaults to None
    tags                              = map(string)
  }))
}

variable "virtual_hub_variables" {
  type = map(object({
    name                       = string
    location                   = string
    resource_group_name        = string
    virtual_wan_name           = string
    address_prefix = string
    virtual_hub_tags           = map(string)
    sku                        = string
    route = list(object({
      route_address_prefixes    = list(string)
      route_next_hop_ip_address = string
    }))
  }))
}

variable "virtual_hub_connection_variables" {
  type = map(object({
    name                            = string
    virtual_hub_name                = string
    virtual_hub_resource_group_name = string
    vnet_name                       = string
    vnet_resource_group_name        = string
  }))
}