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

#VIRTUAL WAN
variable "virtual_wan_variables" {
  type = map(object({
    name                              = string
    resource_group_name               = string
    disable_vpn_encryption            = bool
    allow_branch_to_branch_traffic    = bool
    location                          = string
    type                              = string
    office365_local_breakout_category = string
    tags                              = map(string)
  }))
}

#VPN SITES VARIABLES
variable "vpn_site_variables" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    virtual_wan_id      = string
    device_model        = string
    device_vendor       = string
    address_cidrs       = list(string)
    links = list(object({
      name          = string
      ip_address    = string
      provider_name = string
      speed_in_mbps = number
      fqdn          = string
      bgp_enabled   = bool
      bgp = list(object({
        asn             = number
        peering_address = string
      }))
    }))
    tags = map(string)
  }))
}
