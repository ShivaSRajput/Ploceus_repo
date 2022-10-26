#Route Table Variables
variable "route_table_variables" {
  description = "Map of Route Table object"
  type = map(object({
    name                          = string
    location                      = string
    resource_group_name           = string
    disable_bgp_route_propagation = bool
    tags                           = map(string)
    route = list(object({
      name                   = string
      address_prefix         = string
      next_hop_type          = string
      next_hop_in_ip_address = string
    }))
  }))
}