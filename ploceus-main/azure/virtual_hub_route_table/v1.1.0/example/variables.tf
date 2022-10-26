variable "virtual_hub_variables" {
  type = map(object({
    name                       = string
    location                   = string
    resource_group_name        = string
    virtual_wan_id             = string
    virtual_hub_address_prefix = string
    virtual_hub_tags           = map(string)
  }))
}

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

#VNET variable   #Uncomment the below lines if Vnet creation is required 
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


variable "virtual_hub_connection_variables" {
  type = map(object({
    name                   = string
    virtual_hub_id         = string
    remote_virtual_network = string
    vnet_name              = string
    vnet_hub_name          = string
    resource_group_name    = string
  }))
}

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

