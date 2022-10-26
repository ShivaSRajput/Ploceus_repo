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

# #VNET 
# vnets_variables = {
#   "vnet_1" = {
#     name                        = "ploceusvnet000001a"
#     location                    = "westus2"
#     resource_group_name         = "ploceusrg000001"
#     address_space               = ["10.0.0.0/16"]
#     dns_servers                 = []
#     is_ddos_protection_required = false #Provide the value as true only if ddos_protection_plan is required
#     ddos_protection_plan_name   = null  #Provide the name of the ddos protection plan if above value is true or else keep it as null. If new DDOS protection plan needs to be created uncomment from line 24 to 34
#     vnet_tags = {
#       Created_By = "Ploceus",
#       Department = "CIS"
#     }
#   }
# }

######### Virtual Hub ############### 
virtual_hub_variables = {
  "virtual_hub_1" = {
    name                              = "ploceushub01"
    location                          = "westus2"
    resource_group_name               = "ploceusrg000001"
    virtual_wan_id                    = "ploceuswan01"
    virtual_hub_address_prefix        = "10.0.0.0/24"
  }
}


#Virtual WAN
virtual_wan_variables = {
  "wan_1" = {
    name                              = "ploceuswan01"
    resource_group_name               = "ploceusrg000001"
    location                          = "westus2"
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





express_route_gateway = {
  "express_route_gateway_1" = {
    name                = "expressroutegateway"
    location            = "westus2"
    resource_group_name = "ploceusrg000001"
    virtual_hub_id      = "ploceushub01"
    scale_units         = 1
    express_route_gateway_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
}
}
}

