#VIRTUAL NETWORK GATEWAY VARIABLES
variable "virtual_network_gateway_variables" {
  type = map(object({
    name                               = string
    location                           = string
    resource_group_name                = string
    type                               = string #Valid options are Vpn or ExpressRoute
    vpn_type                           = string
    active_active                      = bool
    enable_bgp                         = bool
    sku                                = string
    default_local_network_gateway_name = string #local network gateway
    edge_zone                          = string
    generation                         = string
    tags                               = map(string)
    private_ip_address_enabled         = bool
    #An active-standby gateway requires exactly one ip_configuration block, 
    #an active-active gateway requires exactly two ip_configuration blocks 
    #an active-active zone redundant gateway with P2S configuration requires exactly three ip_configuration blocks 
    ip_configuration = list(object({
      name                          = string
      private_ip_address_allocation = string #Valid options are Static or Dynamic
      public_ip_address_name        = string
      vnet_name                     = string
    }))
    bgp_settings = list(object({
      asn = number
      #Only one peering_addresses block can be specified except when active_active of this Virtual Network Gateway is true
      #peering_addresses = string
      peering_addresses = list(object({
        ip_configuration_name = string
        apipa_addresses       = list(string) #The valid range for the reserved APIPA address in Azure Public is from 169.254.21.0 to 169.254.22.255.
      }))
      peer_weight = number
    }))
    vpn_client_configuration_enabled = bool
    vpn_client_configuration = list(object({
      address_space                    = string
      vpn_auth_types                   = list(string)
      vpn_client_protocols             = list(string)
      aad_audience                     = string # The client id of the Azure VPN application. Need to check for id from data
      aad_issuer                       = string
      aad_tenant                       = string
      radius_server_address            = string
      radius_server_secret             = string
      root_certificate_enabled         = bool
      root_revoked_certificate_enabled = bool
      root_certificate = list(object({
        name             = string
        public_cert_data = string
      }))
      root_revoked_certificate = list(object({
        name             = string
        public_cert_data = string
      }))
    }))
    custom_route_enabled = bool
    custom_route = list(object({
      address_prefixes = list(string)
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

#Local Network Gateway
variable "local_network_gateway_variables" {
  type = map(object({
    name                 = string
    location             = string
    resource_group_name  = string
    gateway_address      = string #Either gateway_address or gateway_fqdn should be specified.
    gateway_fqdn         = string #Either gateway_address or gateway_fqdn should be specified.
    address_space        = list(string)
    bgp_settings_enabled = bool
    asn                  = number
    bgp_peering_address  = string
    peer_weight          = number
    tags                 = map(string)
  }))
}