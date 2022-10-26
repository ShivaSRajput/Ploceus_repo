#RESOURCE GROUP 
resource_group_variables = {
  "resource_group_1" = {
    name     = "ploceusrg00002"
    location = "westus2"
    resource_group_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

#Route Table 
route_table_variables = {
  "route-1" = {
    name                          = "ploceusrt00001"
    location                      = "westus2"
    resource_group_name           = "ploceusrg00002"
    disable_bgp_route_propagation = false
    tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
    route = [{
      name                   = "ploceusroute001"
      address_prefix         = "10.0.16.0/24"
      next_hop_type          = "None"
      next_hop_in_ip_address = "10.2.0.0/24"
      },
      {
        name                   = "ploceusroute002"
        address_prefix         = "10.0.24.0/24"
        next_hop_type          = "None"
        next_hop_in_ip_address = "10.2.1.0/24"
    }]
  },
  "route-2" = {
    name                          = "ploceusrt00002"
    location                      = "westus2"
    resource_group_name           = "ploceusrg00002"
    disable_bgp_route_propagation = false
    tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
    route = null
  }
}

#Vnet
vnets_variables = {
  "vnet_1" = {
    name                        = "ploceusvnet000001a"
    location                    = "westus2"
    resource_group_name         = "ploceusrg00002"
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


#Subnets
subnet_variables = {
  "subnet_1" = {
    name                                           = "ploceussubnet000001a"
    resource_group_name                            = "ploceusrg00002"
    address_prefixes                               = ["10.0.1.0/24"]
    virtual_network_name                           = "ploceusvnet000001a"
    enforce_private_link_service_network_policies  = true
    enforce_private_link_endpoint_network_policies = true
    is_delegetion_required                         = false #update to true if delegation required and update delegation name,service_name,Service_actions
    service_endpoints                              = ["Microsoft.AzureActiveDirectory"]
    delegation_name                                = "delegation000001"
    service_name                                   = "Microsoft.Sql/managedInstances"
    service_actions                                = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action", "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"]
  },
  "subnet_2" = {
    name                                           = "ploceussubnet000001b"
    resource_group_name                            = "ploceusrg00002"
    address_prefixes                               = ["10.0.2.0/24"]
    virtual_network_name                           = "ploceusvnet000001a"
    enforce_private_link_service_network_policies  = false                                                                                                                                                    #Setting this to true will Disable the policy
    enforce_private_link_endpoint_network_policies = false                                                                                                                                                    #Setting this to true will Disable the policy
    service_endpoints                              = ["Microsoft.AzureActiveDirectory"]                                                                                                                       #update this field if service endpoint is required
    is_delegetion_required                         = false                                                                                                                                                    #update to true if delegation required and update delegation name,service_name,Service_actions
    delegation_name                                = "delegation000002"                                                                                                                                       #Update this field if delgation required
    service_name                                   = "Microsoft.Databricks/workspaces"                                                                                                                        #Update this field if delgation required
    service_actions                                = ["Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action", "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"] #Update this field if delgation required
  }
}

#Subnet -> Route Table Association
subnet_route_table_association_variables = {
  "association-1" = {
    subnet_name          = "ploceussubnet000001a"
    virtual_network_name = "ploceusvnet000001a"
    resource_group_name  = "ploceusrg00002"
    route_table_name     = "ploceusrt00002"
  }
  "association-2" = {
    subnet_name          = "ploceussubnet000001b"
    virtual_network_name = "ploceusvnet000001a"
    resource_group_name  = "ploceusrg00002"
    route_table_name     = "ploceusrt00001"
  }
}