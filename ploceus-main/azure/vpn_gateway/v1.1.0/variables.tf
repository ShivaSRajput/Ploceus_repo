#VPN GATEWAYS VARIABLES
variable "vpn_gateways_variables" {
  type = map(object({
    name                                  = string
    location                              = string
    resource_group_name                   = string
    virtual_hub_name                        = string
    bgp_route_translation_for_nat_enabled = bool
    bgp_settings_enabled = bool
    bgp_settings = object({
      asn                                       = number
      peer_weight                               = number
      instance_0_bgp_peering_address_custom_ips = list(string)
      instance_1_bgp_peering_address_custom_ips = list(string)
    })
    scale_unit         = number
    routing_preference = string
    tags               = map(string)
  }))
}

