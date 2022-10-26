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
    flow_timeout_in_minutes     = number 
    bgp_community               = string
    is_ddos_protection_required = bool
    ddos_protection_plan_name   = string
    vnet_tags                   = map(string)
    edge_zone                   = string
  }))
  default = {}
}

variable "virtual_network_peering_variables" {
  type = map(object({
    vnet_peering_name                = string
    duplex_enabled                   = bool
    destination_resource_group_name  = string
    destination_virtual_network_name = string
    source_resource_group_name       = string
    source_virtual_network_name      = string
    allow_virtual_network_access     = bool
    allow_forwarded_traffic          = bool
    use_remote_gateways              = bool
    allow_gateway_transit            = bool
  }))
  default = {}
}