#Virtual Hub Variables
variable "virtual_hub_variables" {
  type = map(object({
    name                       = string
    location                   = string
    resource_group_name        = string
    virtual_wan_id             = string
    virtual_hub_address_prefix = string
    virtual_hub_tags           = map(string)
    sku                        = string
    route = list(object({
      address_prefixes    = list(string)
      next_hop_ip_address = string
    }))
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

#Virtual Hub IP Variables
variable "virtual_hub_ip_variables" {
  type = map(object({
    name                         = string
    subnet_name                  = string
    vnet_name                    = string
    resource_group_name          = string
    private_ip_address           = string
    private_ip_allocation_method = string
    public_ip_address_name       = string
    virtual_hub_name             = string
  }))
  description = "Virtual Hub IP Values"
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
    edge_zone                   = string
    vnet_tags                   = map(string)
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


#Variables for public IP
variable "public_ip_variables" {
  type = map(object({
    name                    = string
    resource_group_name     = string
    location                = string
    ip_version              = string
    allocation_method       = string
    sku                     = string
    sku_tier                = string
    zones                   = list(string)
    edge_zone               = string
    public_ip_dns           = string
    idle_timeout_in_minutes = string
    reverse_fqdn            = string
    public_ip_prefix_id     = string
    ip_tags                 = map(string)
    public_ip_tags          = map(string)
  }))
}
