#PRIVATE DNS ZONE VIRTUAL NETWORK LINK VARIABLES
variable "private_dns_zone_virtual_network_links" {
  type = map(object({
    name                  = string
    private_dns_zone_name = string
    resource_group_name   = string
    virtual_network_name  = string
    registration_enabled  = bool
    tags                  = map(string)
  }))
} 