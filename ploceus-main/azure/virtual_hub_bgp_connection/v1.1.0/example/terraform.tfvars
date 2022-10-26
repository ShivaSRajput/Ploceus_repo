#RESOURCE GROUP 
resource_group_variables = {
  "resource_group_1" = {
    name     = "ploceusrg00006"
    location = "westus2"
    resource_group_tags = {
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
    resource_group_name        = "ploceusrg00006"
    virtual_wan_id             = null
    virtual_hub_address_prefix = null
    sku                        = "Standard"
    route                      = []
    virtual_hub_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}


#VNET 
vnets_variables = {
  "vnet_1" = {
    name                        = "ploceusvnet00003"
    location                    = "westus2"
    resource_group_name         = "ploceusrg00006"
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
    name                                           = "RouteServerSubnet" #Should not change
    resource_group_name                            = "ploceusrg00006"
    address_prefixes                               = ["10.0.1.0/24"]
    virtual_network_name                           = "ploceusvnet00003"
    enforce_private_link_service_network_policies  = true
    enforce_private_link_endpoint_network_policies = true
    is_delegetion_required                         = false #update to true if delegation required and update delegation name,service_name,Service_actions
    service_endpoints                              = ["Microsoft.AzureActiveDirectory"]
    delegation_name                                = "delegation000001"
    service_name                                   = "Microsoft.Sql/managedInstances"
    service_actions                                = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action", "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"]
  }
}

#PUBLIC IP
public_ip_variables = {
  "public_ip_1" = {
    name                    = "ploceuspip00003"
    resource_group_name     = "ploceusrg00006"
    location                = "westus2"
    ip_version              = "IPv4"
    allocation_method       = "Static"
    sku                     = "Standard"
    sku_tier                = "Regional"
    public_ip_dns           = "ploceuspublicip000003a"
    public_ip_prefix_id     = null
    idle_timeout_in_minutes = "30"
    zones                   = ["1", "3"]
    edge_zone               = null
    reverse_fqdn            = null
    ip_tags                 = null
    public_ip_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

#Virtual Hub IP Variables
virtual_hub_ip_variables = {
  virtual_hub_ip_variables = {
    name                         = "ploceusvhubip00003"
    subnet_name                  = "RouteServerSubnet"
    vnet_name                    = "ploceusvnet00003"
    resource_group_name          = "ploceusrg00006"
    private_ip_address           = "10.5.1.18"
    private_ip_allocation_method = null
    public_ip_address_name       = "ploceuspip00003"
    virtual_hub_name             = "ploceushub01"
  }
}

# Virtual Hub BGP Connection
virtual_hub_bgp_connection_variables = {
  "virtual_hub_bgp_1" = {
    name                = "ploceushubbgp01"
    resource_group_name = "ploceusrg00006"
    virtual_hub_name    = "ploceushub01"
    peer_asn            = 65514
    peer_ip             = "169.254.21.5"
  }
}
