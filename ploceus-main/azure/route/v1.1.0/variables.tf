#Route Variables
variable "route_variables" {
  description = "Map of Route object"
  type = map(object({
    name                   = string
    resource_group_name    = string
    route_table_name       = string
    address_prefix         = string
    next_hop_type          = string #Valid values are VirtualNetworkGateway, VnetLocal, Internet, VirtualAppliance and None
    next_hop_in_ip_address = string
  }))
}