#RESOURCE GROUP 
resource_group_variables = {
  "resource_group_1" = {
    name     = "ploceusrg00001"
    location = "westus2"
    resource_group_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

#Virtual WAN
virtual_wan_variables = {
  "wan_1" = {
    name                              = "ploceuswan00001"
    resource_group_name               = "ploceusrg00001"
    location                          = "westus2"
    disable_vpn_encryption            = null       #Optional; can be null which defaults to false
    allow_branch_to_branch_traffic    = null       #Optional; can be null which defaults to true
    type                              = "Standard" #Optional; can be null which defaults to Standard
    office365_local_breakout_category = "None"     #Optional; can be null which defaults to None
    tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

# Virtual Hub 
virtual_hub_variables = {
  "virtual_hub_1" = {
    name                       = "ploceushub00001"
    location                   = "westus2"
    resource_group_name        = "ploceusrg00001"
    virtual_wan_id             = "ploceuswan00001"
    virtual_hub_address_prefix = "10.0.0.0/24"
    virtual_hub_tags =    {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}


#VPN Gateway
vpn_gateways = {
  "vpn_gateway_1" = {
    name                                  = "ploceusvpngw00001"
    location                              = "westus2"
    resource_group_name                   = "ploceusrg00001"
    virtual_hub_name                      = "ploceushub00001"
    bgp_route_translation_for_nat_enabled = true
    bgp_settings_enabled                  = true
    bgp_settings ={
        asn                                       = 65515
        peer_weight                               = 1
        instance_0_bgp_peering_address_custom_ips = []
        instance_1_bgp_peering_address_custom_ips = []
      }
    scale_unit         = 1
    routing_preference = "Microsoft Network"
    tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

#vpn_gateway_nat_rule
vpn_gateway_nat_rule_variables = {
  vpn_gateway_nat_rule_1 = {
    name                = "ploceusvpngwnatrule00001"
    resource_group_name = "ploceusrg00001"
    vpn_gateway_id      = "ploceusvpngw00001"
    ip_configuration_id = "Instance0"
    mode                = "EgressSnat"
    type                = "Dynamic"
    external_mapping    = {
        address_space   = "192.168.21.0/26"
        port_range      = null
      }
    internal_mapping    = {
      address_space   = "10.4.0.0/26"
        port_range      = null
      }
    }
  }


