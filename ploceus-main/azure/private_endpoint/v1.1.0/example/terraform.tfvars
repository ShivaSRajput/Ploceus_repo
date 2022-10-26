private_endpoint_variables = {
  pe1 = {
    is_manual_connection = false
    resource_group_name  = "ploceusrg000001"
    location             = "westus2"
    #Either private_connection_resource_id or private_connection_resource_alias should have a value
    private_connection_resource_id    = "/subscriptions/0694918c-4701-4100-ab07-5a40a8a82da4/resourceGroups/RG-1/providers/Microsoft.KeyVault/vaults/keyvault-rg1"
    private_connection_resource_alias = null
    subresource_names                 = ["vault"]
    request_message                   = null
    name                              = "ploceuspvtendpoint000001"
    vnet_name                         = "ploceusvnet000001a"
    vnet_resource_group_name          = "ploceusrg000001"
    subnet_name                       = "ploceussubnet000001a"
    private_dns_zone_group_required   = false
    private_dns_zone_group_name       = ""
    private_dns_zone_group_ids        = []
    pe_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}



#VNET
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

#SUBNET
subnet_variables = {
  "subnet_1" = {
    name                                           = "ploceussubnet000001a"
    resource_group_name                            = "ploceusrg000001"
    address_prefixes                               = ["10.0.1.0/24"]
    virtual_network_name                           = "ploceusvnet000001a"
    enforce_private_link_service_network_policies  = true
    enforce_private_link_endpoint_network_policies = true
    is_delegetion_required                         = false #update to true if delegation required and update delegation name,service_name,Service_actions
    service_endpoints                              = ["Microsoft.AzureActiveDirectory"]
    delegation_name                                = "delegation000001"
    service_name                                   = "Microsoft.Sql/managedInstances"
    service_actions                                = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action", "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"]
  }
}

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