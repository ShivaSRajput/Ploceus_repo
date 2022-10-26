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
    name                              = "ploceuswan01"
    resource_group_name               = "ploceusrg00001"
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

######### Virtual Hub ############### 
virtual_hub_variables = {
  "virtual_hub_1" = {
    name                              = "ploceushub01"
    location                          = "westus2"
    resource_group_name               = "ploceusrg00001"
    virtual_wan_id                    = "ploceuswan01"
    virtual_hub_address_prefix        = "10.0.0.0/24"
    virtual_hub_tags =    {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}


  
  
