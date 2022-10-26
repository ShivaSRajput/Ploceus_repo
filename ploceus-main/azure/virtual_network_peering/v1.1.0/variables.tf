variable "virtual_network_peering_variables" {
  type = map(object({
    vnet_peering_name                = string
    duplex_enabled                   = bool
    destination_resource_group_name  = string
    destination_virtual_network_name = string
    source_resource_group_name       = string
    source_virtual_network_name      = string
    allow_virtual_network_access     = bool
    allow_forwarded_traffic          = bool
    use_remote_gateways              = bool
    allow_gateway_transit            = bool
  }))
  default = {}
}
