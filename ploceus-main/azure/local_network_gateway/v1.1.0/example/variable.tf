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

#Local Network Gateway
variable "local_network_gateway_variables" {
  type = map(object({
    name                 = string
    location             = string
    resource_group_name  = string
    gateway_address      = string #Either gateway_address or gateway_fqdn should be specified.
    gateway_fqdn         = string #Either gateway_address or gateway_fqdn should be specified.
    address_space        = list(string)
    bgp_settings_enabled = bool
    asn                  = number
    bgp_peering_address  = string
    peer_weight          = number
    tags                 = map(string)
  }))
}