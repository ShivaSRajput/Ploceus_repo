#Resource group variables
variable "resource_group_variables" {
  description = "Map of Resource groups"
  type = map(object({
    name                = string
    location            = string
    resource_group_tags = map(string)
  }))
  default = {}
}

#VNET Variables
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

#Variables for NSG
variable "network_security_group_variable" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    security_rule = list(object({
      name                                       = string
      description                                = string
      protocol                                   = string
      source_port_range                          = string
      source_port_ranges                         = list(string)
      destination_port_range                     = string
      destination_port_ranges                    = list(string)
      source_address_prefix                      = string
      source_address_prefixes                    = list(string)
      source_application_security_group_ids      = list(string)
      destination_address_prefix                 = string
      destination_address_prefixes               = list(string)
      destination_application_security_group_ids = list(string)
      access                                     = string
      priority                                   = string
      direction                                  = string
    }))
    network_security_group_tags = map(string)
  }))
}

variable "nsg_association_variables" {
  type = map(object({
    subnet_name                = string
    vnet_name                  = string
    subnet_resource_group_name = string
    nsg_name                   = string
    nsg_resource_group_name    = string
  }))
}