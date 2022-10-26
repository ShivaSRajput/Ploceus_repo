#RESOURCE GROUP 
resource_group_variables = {
  "resource_group_1" = {
    name     = "ploceusrg00004"
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
    name                              = "ploceuswan01"
    resource_group_name               = "ploceusrg00004"
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

######### Virtual Hub ############### 
virtual_hub_variables = {
  "virtual_hub_1" = {
    name                       = "ploceushub01"
    location                   = "westus2"
    resource_group_name        = "ploceusrg00004"
    virtual_wan_id             = "ploceuswan01"
    virtual_hub_address_prefix = "10.0.0.0/24"
    virtual_hub_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

#VPN Gateway
vpn_gateways = {
  "vpn_gateway_1" = {
    name                                  = "ploceusvpngw01"
    location                              = "westus2"
    resource_group_name                   = "ploceusrg00004"
    virtual_hub_name                      = "ploceushub01"
    bgp_route_translation_for_nat_enabled = true
    bgp_settings_enabled                  = true
    bgp_settings = {
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


virtual_hub_security_partner_provider_variables = {
  "security_partner_1" = {
    name                   = "ploceussecpart01"
    resource_group_name    = "ploceusrg00004"
    location               = "westus2"
    virtual_hub_name       = "ploceushub01"
    security_provider_name = "IBoss" #Only allowed ZScaler, IBoss and Checkpoint
    tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}