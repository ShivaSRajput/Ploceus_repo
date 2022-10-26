variable "private_endpoint_variables" {
  description = "Map of private endpoint objects. name, subnet_id, is_manual_connection, private_connection_resource_id and subresource_names supported"
  type = map(object({
    is_manual_connection              = bool
    resource_group_name               = string
    location                          = string
    private_connection_resource_id    = string
    private_connection_resource_alias = string
    subresource_names                 = list(string)
    request_message                   = string
    name                              = string
    pe_tags                           = map(string)
    vnet_name                         = string
    vnet_resource_group_name          = string
    subnet_name                       = string
    private_dns_zone_group_required   = bool
    private_dns_zone_group_name       = string
    private_dns_zone_group_ids        = list(string)
  }))
  default = null
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
    flow_timeout_in_minutes     = number
    bgp_community               = string
    is_ddos_protection_required = bool
    ddos_protection_plan_name   = string
    vnet_tags                   = map(string)
    edge_zone                   = string
  }))
  default = {}
}


#Subnet Variables
variable "subnet_variables" {
  type = map(object({
    name                                           = string
    resource_group_name                            = string
    virtual_network_name                           = string
    address_prefixes                               = list(string)
    enforce_private_link_service_network_policies  = bool
    enforce_private_link_endpoint_network_policies = bool
    service_endpoints                              = list(string)
    is_delegetion_required                         = bool
    delegation_name                                = string
    service_name                                   = string
    service_actions                                = list(string)
  }))
  default = {}
}

#RG Variables
variable "resource_group_variables" {
  description = "Map of Resource groups"
  type = map(object({
    name                = string
    location            = string
    resource_group_tags = map(string)
  }))
  default = {}
}