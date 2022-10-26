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

#Virtual WAN
virtual_wan_variables = {
  "wan_1" = {
    name                              = "ploceuswan000001"
    resource_group_name               = "ploceusrg000001"
    location = "westus2"
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




