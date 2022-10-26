#Virtual Hub Route Table Variables
variable "virtual_hub_route_table_variables" {
  type = map(object({
    name                = string
    resource_group_name = string
    virtual_hub_name    = string
    labels              = list(string)
    route = list(object({
      name              = string
      destinations_type = string
      destinations      = list(string)
      next_hop_type     = string
      next_hop_subscription = string
      next_hop_resource_group = string
      next_hop_virtual_hub  = string
      next_hop_name          = string #virtual_hub_connection_name
    }))
  }))
}
