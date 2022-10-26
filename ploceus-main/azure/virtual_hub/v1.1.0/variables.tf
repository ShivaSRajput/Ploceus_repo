#Virtual Hub Variables
variable "virtual_hub_variables" {
  type = map(object({
    name                       = string
    location                   = string
    resource_group_name        = string
    virtual_wan_name             = string
    address_prefix = string
    virtual_hub_tags           = map(string)
    sku                        = string
    route = list(object({
      route_address_prefixes    = list(string)
      route_next_hop_ip_address = string
    }))
  }))
}
