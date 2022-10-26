#RESOURCE GROUP 
resource_group_variables = {
  "resource_group_1" = {
    name     = "ploceusrg000003"
    location = "westus2"
    resource_group_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

#Local Network Gateway

local_network_gateway_variables = {
  "lgn_1" = {
    name                 = "ploceuslng000001"
    location             = "westus2"
    resource_group_name  = "ploceusrg000003"
    gateway_address      = "49.37.67.201" #Either gateway_address or gateway_fqdn should be specified. So please use null for the one not being used.
    gateway_fqdn         = null #Either gateway_address or gateway_fqdn should be specified. So please use null for the one not being used.
    address_space        = ["10.0.0.0/16"]
    bgp_settings_enabled = false
    asn                  = null
    bgp_peering_address  = ""
    peer_weight          = null
    tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}