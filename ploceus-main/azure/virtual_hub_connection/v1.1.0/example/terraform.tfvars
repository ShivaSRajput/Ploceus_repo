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

#VNET uncomment to create Vnet
vnets_variables = {
  "vnet_1" = {
    name                        = "ploceusvnet000001a"
    location                    = "westus2"
    resource_group_name         = "ploceusrg000001"
    address_space               = ["10.0.0.0/16"]
    dns_servers                 = []
    flow_timeout_in_minutes     = null #possible values are between 4 and 30 minutes.
    bgp_community               = null
    edge_zone                   = null
    is_ddos_protection_required = false #Provide the value as true only if ddos_protection_plan is required
    ddos_protection_plan_name   = null  #Provide the name of the ddos protection plan if above value is true or else keep it as null. If new DDOS protection plan needs to be created uncomment from line 24 to 34
    vnet_tags = {
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
######### Virtual Hub Connection ############### 
virtual_hub_connection_variables = {
  virtual_hub_connection_1 = {
    name                            = "ploceushubconnection000001"
    virtual_hub_name                = "ploceushub000001"
    virtual_hub_resource_group_name = "ploceusrg00001"
    vnet_name                       = "ploceusvnet000001a"
    vnet_resource_group_name        = "ploceusrg00001"
  }
}



virtual_hub_subscription_id = "070e769c-b870-488d-ad31-3707ced9fedf"
virtual_hub_tenant_id       = "687f51c3-0c5d-4905-84f8-97c683a5b9d1"
vnet_subscription_id        = "070e769c-b870-488d-ad31-3707ced9fedf"
vnet_tenant_id              = "687f51c3-0c5d-4905-84f8-97c683a5b9d1"
