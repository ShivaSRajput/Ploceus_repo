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

#Virtual Hub Variables
variable "virtual_hub_variables" {
  type = map(object({
    name                       = string
    location                   = string
    resource_group_name        = string
    virtual_wan_name             = string
    address_prefix = string
    virtual_hub_tags           = map(string)
    sku                        = string
    route = list(object({
      route_address_prefixes    = list(string)
      route_next_hop_ip_address = string
    }))
  }))
}

#VIRTUAL WAN
variable "virtual_wan_variables" {
  type = map(object({
    name                              = string
    resource_group_name               = string
    disable_vpn_encryption            = bool
    allow_branch_to_branch_traffic    = bool
    location                          = string
    type                              = string
    office365_local_breakout_category = string
    tags                              = map(string)
  }))
}

#VPN GATEWAYS VARIABLES
variable "vpn_gateway_variables" {
  description = "Map of vpn gateway variables"
  type = map(object({
    name                                  = string
    location                              = string
    resource_group_name                   = string
    virtual_hub_name                      = string
    bgp_route_translation_for_nat_enabled = bool
    bgp_settings_enabled                  = bool
    bgp_settings = object({
      asn                                       = number
      peer_weight                               = number
      instance_0_bgp_peering_address_custom_ips = list(string)
      instance_1_bgp_peering_address_custom_ips = list(string)
    })
    scale_unit         = number
    routing_preference = string
    tags               = map(string)
  }))
}

#VPN SITES VARIABLES
variable "vpn_site_variables" {
  description = "Map of virtual site variables"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    virtual_wan_name    = string
    device_model        = string
    device_vendor       = string
    address_cidrs       = list(string)
    links = list(object({
      name          = string
      ip_address    = string
      provider_name = string
      speed_in_mbps = number
      fqdn          = string
      bgp_enabled   = bool
      bgp = list(object({
        asn             = number
        peering_address = string
      }))
    }))
    tags = map(string)
  }))
}

variable "vpn_gateway_connection_variables" {
  description = "Map of virtual gateway connection variables" 
  type = map(object({
    name                                    = string
    location                                = string
    vpn_site_resource_group_name            = string
    vpn_gateway_resource_group_name         = string
    virtual_hub_resource_group_name         = string
    vpn_gateway_name                        = string
    remote_vpn_site                         = string
    internet_security_enabled               = bool  #optional parameter defaults to false
    virtual_hub_name                        = string
    routing_required                        = bool #optional if not specified default route table will be created implicitly
    associated_route_table                  = string #provide this value when routing_required is true 
    propagated_route_table_labels           = list(string) #optional when routing_required is true 
    propagated_route_table_route_table_name = list(string) #required when routing_required is true 
    traffic_selector_policy_required        = bool #optional
    traffic_selector_local_address_ranges   = list(string) #required when traffic_selector_policy_required is true
    traffic_selector_remote_address_ranges  = list(string) #required when traffic_selector_policy_required is true
    vpn_links = list(object({
      name               = string
      bandwidth_mbps     = number
      bgp_enabled        = bool
      connection_mode    = string
      vpn_site_link_name = string
      custom_bgp_address = list(object({
        ip_address          = string
        ip_configuration_id = string #Must contain Instance0,Instance1
      }))
      egress_nat_rule_ids  = list(string)
      ingress_nat_rule_ids = list(string)
      ipsec_policies = list(object({
        integrity_algorithm      = string
        pfs_group                = string
        sa_data_size_kb          = string
        sa_lifetime_sec          = string
        dh_group                 = string
        encryption_algorithm     = string
        ike_encryption_algorithm = string
        ike_integrity_algorithm  = string
      }))
      local_azure_ip_address_enabled        = bool
      policy_based_traffic_selector_enabled = bool
      protocol                              = string
      ratelimit_enabled                     = bool
      route_weight                          = number
      shared_key                            = string
    }))
  }))
}
