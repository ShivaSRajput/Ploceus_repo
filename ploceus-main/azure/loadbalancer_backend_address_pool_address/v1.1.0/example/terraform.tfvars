#VNET 
vnets_variables = {
  "vnet_1" = {
    name                        = "ploceusvnet000001"
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
  },
  "vnet_2" = {
    name                        = "ploceusvnet000002"
    location                    = "westus2"
    resource_group_name         = "ploceusrg000001"
    address_space               = ["11.0.0.0/16"]
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
    resource_group_name                            = "ploceusrg000001"
    address_prefixes                               = ["10.0.1.0/24"]
    virtual_network_name                           = "ploceusvnet000001"
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
    resource_group_name                            = "ploceusrg000001"
    address_prefixes                               = ["10.0.2.0/24"]
    virtual_network_name                           = "ploceusvnet000001"
    enforce_private_link_service_network_policies  = false                                                                                                                                                    #Setting this to true will Disable the policy
    enforce_private_link_endpoint_network_policies = false                                                                                                                                                    #Setting this to true will Disable the policy
    service_endpoints                              = ["Microsoft.AzureActiveDirectory"]                                                                                                                       #update this field if service endpoint is required
    is_delegetion_required                         = false                                                                                                                                                    #update to true if delegation required and update delegation name,service_name,Service_actions
    delegation_name                                = "delegation000002"                                                                                                                                       #Update this field if delgation required
    service_name                                   = "Microsoft.Databricks/workspaces"                                                                                                                        #Update this field if delgation required
    service_actions                                = ["Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action", "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"] #Update this field if delgation required
  }
}
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

load_balancers = {
  loadbalancer1 = {
    name                   = "ploceuslb000001"
    lb_resource_group_name = "ploceusrg000001"
    location               = "westus2"
    sku                    = "Standard"
    sku_tier               = "Regional"
    frontend_ip_config = [
      {
        name        = "ploceuslbfe000001"
        subnet_name = "ploceussubnet000001a"
        vnet_name   = "ploceusvnet000001"
        static_ip   = null               # "10.0.1.4" #(Optional) Set null to get dynamic IP 
        zones       = ["Zone-Redundant"] #Zone-Redundant is not working  in the selected Region.
      },
      {
        name        = "ploceuslbfe000002"
        subnet_name = "ploceussubnet000001a"
        vnet_name   = "ploceusvnet000001"
        static_ip   = null # "10.0.1.4" #(Optional) Set null to get dynamic IP
        zones       = ["Zone-Redundant"]
      }
    ]
    public_ip_name = null
    lb_tags        = { created_by = "Ploceus" }
  },
  loadbalancer2 = {
    name                   = "ploceuslb000002"
    sku                    = "Standard"
    sku_tier               = "Regional"
    location               = "westus2"
    lb_resource_group_name = "ploceusrg000001"
    frontend_ip_config = [
      {
        name        = "ploceuslbfe000003"
        subnet_name = "ploceussubnet000001a"
        vnet_name   = "ploceusvnet000001"
        static_ip   = null # "10.0.1.4" #(Optional) Set null to get dynamic IP 
        zones       = null
      },
      {
        name        = "ploceuslbfe000004"
        subnet_name = "ploceussubnet000001a"
        vnet_name   = "ploceusvnet000001"
        static_ip   = null # "10.0.1.4" #(Optional) Set null to get dynamic IP
        zones       = null
      }
    ]
    public_ip_name = null
    lb_tags        = { created_by = "Ploceus" }
  }
}

load_balancer_backendpools = {
  backendpool_1 = {
    name      = "ploceuslbbp000001"
    lb_name   = "ploceuslb000001"
    lb_rgname = "ploceusrg000001"
  },
  backendpool_2 = {
    name      = "ploceuslbbp000002"
    lb_name   = "ploceuslb000001"
    lb_rgname = "ploceusrg000001"
  },
  backendpool_3 = {
    name      = "ploceuslbbp000003"
    lb_name   = "ploceuslb000002"
    lb_rgname = "ploceusrg000001"
  },
  backendpool_4 = {
    name      = "ploceuslbbp000004"
    lb_name   = "ploceuslb000002"
    lb_rgname = "ploceusrg000001"
  }
}
loadbalancer_backend_address_pool_address = {
  backendpool_address_1 = {
    name        = "ploceuslbbpaddress000001"
    ip_address  = "10.0.0.15"
    lb_name     = "ploceuslb000001"
    lb_rgname   = "ploceusrg000001"
    vnet_rgname = "ploceusrg000001"
  }
}

