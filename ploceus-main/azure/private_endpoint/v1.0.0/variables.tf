variable "private_endpoints" {
  description = "Map of private endpoint objects. name, subnet_id, is_manual_connection, private_connection_resource_id and subresource_names supported"

  type = map(object({
    is_manual_connection           = bool
    resource_group_name            = string
    location                       = string
    private_connection_resource_id = string
    subresource_names              = list(string)
    request_message                = string
    name                           = string
    tags                           = map(string)

  }))
  default = null
}





#VNET variable
variable "vnets_variables" {
  description = "Map of vnet objects. name, vnet_address_space, and dns_server supported"
  type = map(object({
    vnet_name           = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    dns_servers         = list(string)

    is_ddos_protection_required = bool
    ddos_protection_plan_name   = string
    vnet_tags                   = map(string)
  }))
  default = {}
}

#Subnet Variables
variable "subnet_variables" {
  type = map(object({
    subnet_name                                    = string
    resource_group_name                            = string
    virtual_network_name                           = string
    address_prefixes                               = list(string)
    enforce_private_link_service_network_policies  = bool
    enforce_private_link_endpoint_network_policies = bool
  }))
  default = {}
}

# variable "keyvault_name"{

# }

# variable "keyvault_resourcegroup"{

# }