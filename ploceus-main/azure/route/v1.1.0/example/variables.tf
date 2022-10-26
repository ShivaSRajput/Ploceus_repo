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

#Route Variables
variable "route_variables" {
  description = "Map of Route object"
  type = map(object({
    name                   = string
    resource_group_name    = string
    route_table_name       = string
    address_prefix         = string
    next_hop_type          = string
    next_hop_in_ip_address = string
  }))
}