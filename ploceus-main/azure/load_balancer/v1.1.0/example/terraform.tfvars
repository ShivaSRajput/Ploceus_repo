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
  }
}
#SUBNET
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
  }
}
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

load_balancers_variables = {
  "lb1" = {
    load_balancer_edge_zone = null
    load_balancer_frontend_ip_configuration = {
      "config1" = {
        frontend_ip_configuration_gateway_load_balancer_frontend_ip_configuration_id = {
          gateway_load_balancer_name                = null
          gateway_load_balancer_resource_group_name = null
        }
        frontend_ip_configuration_name                          = "ploceusconfig000001"
        frontend_ip_configuration_private_ip_address            = "10.0.1.4"
        frontend_ip_configuration_private_ip_address_allocation = "Static"
        frontend_ip_configuration_private_ip_address_version    = "IPv4"
        frontend_ip_configuration_public_ip_address_id = {
          public_ip_name                = null
          public_ip_resource_group_name = null
        }
        frontend_ip_configuration_public_ip_prefix_id = {
          public_ip_prefix_name                = null
          public_ip_prefix_resource_group_name = null
        }
        frontend_ip_configuration_subnet = {
          subnet_name                    = "ploceussubnet000001a"
          subnet_virtual_network_name    = "ploceusvnet000001"
          virtual_network_resource_group = "ploceusrg000001"
        }
        frontend_ip_configuration_zones = null
      }
    }
    load_balancer_location            = "westus2"
    load_balancer_name                = "ploceuslb00001"
    load_balancer_resource_group_name = "ploceusrg000001"
    load_balancer_sku                 = "Basic"
    load_balancer_sku_tier            = "Regional"
    load_balancer_tags = {
      "Created_By" = "Ploceus"
      Department   = "CIS"
    }
  }
  "lb2" = {
    load_balancer_edge_zone = null
    load_balancer_frontend_ip_configuration = {
      "config1" = {
        frontend_ip_configuration_gateway_load_balancer_frontend_ip_configuration_id = {
          gateway_load_balancer_name                = null
          gateway_load_balancer_resource_group_name = null
        }
        frontend_ip_configuration_name                          = "ploceusconfig000001"
        frontend_ip_configuration_private_ip_address            = null
        frontend_ip_configuration_private_ip_address_allocation = null
        frontend_ip_configuration_private_ip_address_version    = null
        frontend_ip_configuration_public_ip_address_id = {
          public_ip_name                = "ploceuspublicip000002a"
          public_ip_resource_group_name = "ploceusrg000001"
        }
        frontend_ip_configuration_public_ip_prefix_id = {
          public_ip_prefix_name                = null
          public_ip_prefix_resource_group_name = null
        }
        frontend_ip_configuration_subnet = {
          subnet_name                    = null
          subnet_virtual_network_name    = null
          virtual_network_resource_group = null
        }
        frontend_ip_configuration_zones = null
      }
    }
    load_balancer_location            = "westus2"
    load_balancer_name                = "ploceuslb00002"
    load_balancer_resource_group_name = "ploceusrg000001"
    load_balancer_sku                 = "Standard"
    load_balancer_sku_tier            = "Regional"
    load_balancer_tags = {
      "Created_By" = "Ploceus"
      Department   = "CIS"
    }
  }
}

public_ip_variables = {
  "public_ip_1" = {
    name                    = "ploceuspublicip000002a"
    resource_group_name     = "ploceusrg000001"
    location                = "westus2"
    ip_version              = "IPv4"
    allocation_method       = "Static"
    sku                     = "Standard"
    sku_tier                = "Regional"
    public_ip_dns           = "ploceuspublicip000002a"
    public_ip_prefix_id     = null
    idle_timeout_in_minutes = "30"
    zones                   = null
    edge_zone               = null
    reverse_fqdn            = null
    ip_tags                 = null
    public_ip_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}