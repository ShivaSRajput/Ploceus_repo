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

#VIRTUAL HUB VARIABLES
variable "virtual_hub_variables" {
  type = map(object({
    name                       = string
    location                   = string
    resource_group_name        = string
    virtual_wan_id             = string
    virtual_hub_address_prefix = string
    virtual_hub_tags =    map(string)
  }))
}

#VIRTUAL WAN
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

#VPN GATEWAYS VARIABLES
variable "vpn_gateways" {
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

#vpn_gateway_nat_rule_variables VARIABLES
variable "vpn_gateway_nat_rule_variables" {
  type = map(object({
    name                        = string
    resource_group_name         = string
    vpn_gateway_id              = string
    ip_configuration_id         = string
    mode                        = string
    type                        = string
    external_mapping            = object({
      address_space             = string
      port_range                = string
    })
    internal_mapping            = object({
      address_space             = string
      port_range                = string
    })
  }))
}




