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
vpn_sites = {
  "vpn_site_1" = {
    name                = "ploceusvpnsite000001"
    location            = "westus2"
    resource_group_name = "ploceusrg000001"
    virtual_wan_name      = "ploceuswan000001"
    device_model        = null
    device_vendor       = null
    address_cidrs       = ["10.1.0.0/24"]
    #The address_cidrs has to be set when the link.bgp isn't specified
    # address_cidrs                         = null
    "links" = [
      {
        name          = "link1"
        ip_address    = "10.1.0.1"
        fqdn          = null
        provider_name = "ploceus"
        speed_in_mbps = 50
        bgp_enabled   = false
        "bgp" = [{
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
