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

variable "virtual_hub_variables" {
  type = map(object({
    name                              = string
    location                          = string
    resource_group_name               = string
    virtual_wan_id                    = string
    virtual_hub_address_prefix        = string
  }))
}

variable "virtual_wan_variables" {
  type = map(object({
    name                              = string
    resource_group_name               = string
    disable_vpn_encryption            = bool
    allow_branch_to_branch_traffic    = bool
    location = string
    type                              = string
    office365_local_breakout_category = string
    tags                              = map(string)
  }))
}


variable "express_route_gateway" {
description = "expressroute gateway variables"
type = map(object({
    name                        =    string
    location                    = string
    resource_group_name         = string
    virtual_hub_id              = string
    scale_units              = number
    express_route_gateway_tags            = map(string)
    
}))

  
}
