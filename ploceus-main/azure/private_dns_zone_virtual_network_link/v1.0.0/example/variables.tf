#PRIVATE DNS ZONE VARIABLES
variable "private_dns_zones" {
  description = "Private DNS Zone Variable"
  type = map(object({
    name                = string
    resource_group_name = string
    tags                = map(string)
    soa_record_enabled  = bool
    soa_record = object({
      email        = string
      expire_time  = number
      minimum_ttl  = number
      refresh_time = number
      retry_time   = number
      ttl          = number
      soa_tags     = map(string)
    })
  }))
}

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

#VNET variable
variable "vnets_variables" {
  description = "Map of vnet objects. name, vnet_address_space, and dns_server supported"
  type = map(object({
    name                        = string
    location                    = string
    resource_group_name         = string
    address_space               = list(string)
    dns_servers                 = list(string)
    is_ddos_protection_required = bool
    ddos_protection_plan_name   = string
    vnet_tags                   = map(string)
  }))
  default = {}
}
