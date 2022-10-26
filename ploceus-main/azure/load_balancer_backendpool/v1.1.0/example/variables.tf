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

variable "load_balancer_backendpool_variables" {
  type = map(object({
    load_balancer_backendpool_name                      = string
    load_balancer_name                                  = string
    load_balancer_resource_group_name                   = string
    load_balancer_backendpool_tunnel_interface_required = bool
    load_balancer_backendpool_tunnel_interface_variables = map(object({
      load_balancer_backendpool_tunnel_interface_identifier = string
      load_balancer_backendpool_tunnel_interface_type       = string
      load_balancer_backendpool_tunnel_interface_protocol   = string
      load_balancer_backendpool_tunnel_interface_port       = string
    }))
  }))
  description = "Map containing load balancer backend address pools"
  default     = {}
}

variable "load_balancers_variables" {
  type = map(object({
    load_balancer_name                = string
    load_balancer_resource_group_name = string
    load_balancer_location            = string
    load_balancer_edge_zone           = string
    load_balancer_frontend_ip_configuration = map(object({
      frontend_ip_configuration_name  = string
      frontend_ip_configuration_zones = list(string)
      frontend_ip_configuration_subnet = object({
        subnet_name                    = string
        subnet_virtual_network_name    = string
        virtual_network_resource_group = string
      })
      frontend_ip_configuration_gateway_load_balancer_frontend_ip_configuration_id = object({
        gateway_load_balancer_name                = string
        gateway_load_balancer_resource_group_name = string
      })
      frontend_ip_configuration_private_ip_address            = string
      frontend_ip_configuration_private_ip_address_allocation = string
      frontend_ip_configuration_private_ip_address_version    = string
      frontend_ip_configuration_public_ip_address_id = object({
        public_ip_name                = string
        public_ip_resource_group_name = string
      })
      frontend_ip_configuration_public_ip_prefix_id = object({
        public_ip_prefix_name                = string
        public_ip_prefix_resource_group_name = string
      })
    }))
    load_balancer_sku      = string
    load_balancer_sku_tier = string
    load_balancer_tags     = map(string)
  }))
  default = {}
}