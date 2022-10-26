#Route Table Variables
variable "route_table_variables" {
  description = "Map of Route Table object"
  type = map(object({
    name                          = string
    location                      = string
    resource_group_name           = string
    disable_bgp_route_propagation = bool
    tags                          = map(string)
    route = list(object({
      name                   = string
      address_prefix         = string
      next_hop_type          = string
      next_hop_in_ip_address = string
    }))
  }))
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
    edge_zone                   = string
    vnet_tags                   = map(string)
  }))
  default = {}
}

#DDOS protection plan variable #Uncomment the below lines if DDOS protection is required 
#variable "ddos_protection_plan_variables" {
# type = map(object({
# name                            = string
#resource_group_name             = string
#location                        = string
#ddos_protection_plan_tags       = map(string)
#}))
#}


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

#Subnet -> Route Table Association Variables
variable "subnet_route_table_association_variables" {
  description = "Map of Subnet Route Table Association object"
  type = map(object({
    subnet_name          = string
    virtual_network_name = string
    resource_group_name  = string
    route_table_name     = string
  }))
}