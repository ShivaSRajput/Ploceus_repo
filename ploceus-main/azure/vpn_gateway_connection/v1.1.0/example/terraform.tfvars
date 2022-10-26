#RESOURCE GROUP 
resource_group_variables = {
  "resource_group_1" = {
    name     = "ploceusrg000001"
    location = "westus2"
    resource_group_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

#VIRTUAL WAN
virtual_wan_variables = {
  "wan_1" = {
    name                              = "ploceusvirtualwan000001"
    resource_group_name               = "ploceusrg000001"
    location = "westus2"
    disable_vpn_encryption            = null #Optional; can be null which defaults to false
    allow_branch_to_branch_traffic    = null #Optional; can be null which defaults to true
    type                              = "Standard" #Optional; can be null which defaults to Standard
    office365_local_breakout_category = "None" #Optional; can be null which defaults to None
    tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

#Virtual Hub  
virtual_hub_variables = {
  "virtual_hub_1" = {
    name                       = "ploceushub000001"
    location                   = "westus2"
    resource_group_name        = "ploceusrg000001"
    virtual_wan_name             = "ploceuswan000001"
    address_prefix = "10.0.0.0/24"
    sku                        = "Standard"
    route                      = []
    virtual_hub_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

#VPN Gateway
vpn_gateway_variables = {
  "vpn_gateway_1" = {
    name                                  = "ploceusvpngw000001"
    location                              = "westus2"
    resource_group_name                   = "ploceusrg000001"
    virtual_hub_name                      = "ploceushub000001"
    bgp_route_translation_for_nat_enabled = true
    bgp_settings_enabled                  = true
    bgp_settings = {
      asn         = 65515
      peer_weight = 1
      # to enable custom_bgp_address in vpn_gateway_connection below values should not be empty
      instance_0_bgp_peering_address_custom_ips = ["169.254.21.2"]
      instance_1_bgp_peering_address_custom_ips = ["169.254.22.2"]
    }
    scale_unit         = 1
    routing_preference = "Microsoft Network"
    tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

vpn_site_variables = {
  "vpn_site_1" = {
    name                = "ploceusvpnsite0000001"
    location            = "westus2"
    resource_group_name = "ploceusrg000001"
    virtual_wan_name     = "ploceuswan000001"
    device_model        = null
    device_vendor       = null
    address_cidrs       = ["10.1.0.0/24"]
    #The address_cidrs has to be set when the link.bgp isn't specified
    # address_cidrs                         = null
    links = [
      {
        name          = "link1"
        ip_address    = "10.1.0.1"
        fqdn          = null
        provider_name = "abcd"
        speed_in_mbps = 50
        bgp_enabled   = false
        bgp = [{
          asn             = 65021
          peering_address = "169.254.22.3"
        }]
      }
    ]
    tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}


vpn_gateway_connection_variables = {
  "vpn_gateway_connection_1" = {
    name                            = "ploceuswan000001"
    location                        = "westus2"
    resource_group_name             = "ploceusrg000001"
    virtual_hub_resource_group_name = "ploceusrg000001"
    vpn_gateway_resource_group_name = "ploceusrg000001"
    vpn_site_resource_group_name    = "ploceusrg000001"
    vpn_gateway_name                = "ploceusvpngw000001"
    remote_vpn_site                 = "ploceusvpnsite000001"
    internet_security_enabled       = false
    virtual_hub_name                = "ploceushub000001"
    #routing
    routing_required                        = false
    associated_route_table                  = null
    propagated_route_table_labels           = null
    propagated_route_table_route_table_name = null
    #traffic_selector_policy
    traffic_selector_policy_required       = false
    traffic_selector_local_address_ranges  = []
    traffic_selector_remote_address_ranges = []
    vpn_links = [
      {
        name               = "vpn_link1"
        bandwidth_mbps     = 10
        bgp_enabled        = false
        connection_mode    = "Default"
        vpn_site_link_name = "link1"

        # if bgp is enabled pass values for custom_bgp_address
        custom_bgp_address = [{
          ip_address          = "169.254.21.2"
          ip_configuration_id = "Instance0"
          },
          {
            ip_address          = "169.254.22.2"
            ip_configuration_id = "Instance1"
        }]

        egress_nat_rule_ids  = null
        ingress_nat_rule_ids = null
        ipsec_policies = [
          {
            integrity_algorithm      = "SHA256"
            pfs_group                = "None"
            sa_data_size_kb          = 1024
            sa_lifetime_sec          = 300
            dh_group                 = "DHGroup14"
            encryption_algorithm     = "AES128"
            ike_encryption_algorithm = "AES128"
            ike_integrity_algorithm  = "SHA256"
          }
        ]
        local_azure_ip_address_enabled        = false
        policy_based_traffic_selector_enabled = false
        protocol                              = "IKEv2"
        ratelimit_enabled                     = false
        route_weight                          = 0
        shared_key                            = null
      }
    ]
  }
}

# provider variables
vpn_gateway_subscription_id      = "fb621b27-4282-41e1-bf18-6e944ae55145"
vpn_gateway_tenant_id            = "686f51c3-0c5d-4905-84f8-97d685a5b0d1"
vpn_site_subscription_id = "fb621b27-4282-41e1-bf18-6e944ae55145"
vpn_site_tenant_id       = "686f51c3-0c5d-4905-84f8-97d685a5b0d1"