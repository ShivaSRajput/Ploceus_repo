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
    virtual_hub_address_prefix = "10.1.0.0/24"
    virtual_hub_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

######### Virtual Hub Connection ############### 
virtual_hub_connection_variables = {
  virtual_hub_connection_1 = {
    name                   = "ploceushubconnection01"
    virtual_hub_id         = "ploceushub01"
    remote_virtual_network = "ploceusvnet000001a"
    vnet_name              = "ploceusvnet000001a"
    vnet_hub_name          = "ploceushub01"
    resource_group_name    = "ploceusrg00004"
  }
}

#VNET uncomment to create Vnet
vnets_variables = {
  "vnet_1" = {
    name                        = "ploceusvnet000001a"
    location                    = "westus2"
    resource_group_name         = "ploceusrg00004"
    address_space               = ["10.0.0.0/16"]
    dns_servers                 = []
    is_ddos_protection_required = false                   #Provide the value as true only if ddos_protection_plan is required
    ddos_protection_plan_name   = "ploceusddosplan000001" #Provide the name of the ddos protection plan if above value is true or else keep it as null. If new DDOS protection plan needs to be created uncomment from line 24 to 34
    vnet_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

#Virtual Hub Route Table Variables
virtual_hub_route_table_variables = {
  route-1 = {
    name                = "ploceusvhrt00001"
    resource_group_name = "ploceusrg00004"
    virtual_hub_name    = "ploceushub01"
    labels              = ["ploceusvhrt00001"]
    route = [{
      name              = "ploceusvhroute00001"
      destinations_type = "CIDR"
      destinations      = ["10.1.0.0/24"]
      next_hop_type     = "ResourceId"
      next_hop_subscription = "070e769c-b870-488d-ad31-3707ced9fedf"
      next_hop_resource_group = "ploceusrg00004"
      next_hop_virtual_hub  = "ploceushub01"
      next_hop_name          = "ploceushubconnection01" #/subscriptions/070e769c-b870-488d-ad31-3707ced9fedf/resourceGroups/ploceusrg00004/providers/Microsoft.Network/virtualHubs/ploceushub01/hubVirtualNetworkConnections/ploceushubconnection01
    }]
  }
}


