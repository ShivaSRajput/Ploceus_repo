variable "vpn_site_variables" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    virtual_wan_name      = string
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