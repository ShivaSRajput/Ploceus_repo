# VPN GATEWAY CONNECTION VARIABLES
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
