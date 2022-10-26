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

#DDOS plan creation is optional and costly. Uncommenting the below module (line 24 to 34) will create a new DDOS protection plan. Use only if required. 
#If DDOS protection plan is required for vnet also uncomment lines 40 to 47 from variable.tf inside example folder and
#Also uncomment lines 9 to 12 from main.tf inside example folder

#DDOS protection plan (Optional module for VNET)
# ddos_protection_plan_variables = {
#   "ddos_plan_1" = {
#     name                            = "sepatternddosplan000002"
#     location                        = "westus2"
#     resource_group_name             = "se_pattern"
#     ddos_protection_plan_tags = {
#       Created_By = "Ploceus",
#       Department = "CIS"
#     }
#   }
# }

#SUBNET
subnet_variables = {
  "subnet_1" = {
    name                 = "ploceussubnet000001"
    resource_group_name  = "ploceusrg000001"
    address_prefixes     = ["10.0.1.0/24"]
    virtual_network_name = "ploceusvnet000001"
    enforce_private_link_service_network_policies  = true
    enforce_private_link_endpoint_network_policies = true
    is_delegetion_required                         = false #update to true if delegation required and update delegation name,service_name,Service_actions
    service_endpoints                              = ["Microsoft.AzureActiveDirectory"]
    delegation_name                                = "delegation000001"
    service_name                                   = "Microsoft.Sql/managedInstances"
    service_actions                                = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action", "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"]

  },
  "subnet_2" = {
    name                 = "ploceussubnet000002"
    resource_group_name  = "ploceusrg000001"
    address_prefixes     = ["10.0.2.0/24"]
    virtual_network_name = "ploceusvnet000001"
    enforce_private_link_service_network_policies  = false                                                                                                                                                  #Setting this to true will Disable the policy
    enforce_private_link_endpoint_network_policies = false                                                                                                                                                    #Setting this to true will Disable the policy
    service_endpoints                              = ["Microsoft.AzureActiveDirectory"]                                                                                                                       #update this field if service endpoint is required
    is_delegetion_required                         = false                                                                                                                                                    #update to true if delegation required and update delegation name,service_name,Service_actions
    delegation_name                                = "delegation000002"                                                                                                                                       #Update this field if delgation required
    service_name                                   = "Microsoft.Databricks/workspaces"                                                                                                                        #Update this field if delgation required
    service_actions                                = ["Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action", "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"] #Update this field if delgation required
  }
}

#PUBLIC IP
public_ip_variables = {
  "public_ip_1" = {
    name                    = "ploceuspublicip000001"
    resource_group_name     = "ploceusrg000001"
    location                = "westus2"
    ip_version              = "IPv4"
    allocation_method       = "Static"
    sku                     = "Standard"
    sku_tier                = "Regional"
    public_ip_dns           = "ploceuspublicip000001"
    idle_timeout_in_minutes = "30"
    zones                   = ["1"]
    edge_zone               = null
    public_ip_prefix_id     = null
    reverse_fqdn            = null
    ip_tags                 = null
    public_ip_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  },
  "public_ip_2" = {
    name                    = "ploceuspublicip000002"
    resource_group_name     = "ploceusrg000001"
    location                = "westus2"
    ip_version              = "IPv4"
    allocation_method       = "Static"
    sku                     = "Standard"
    sku_tier                = "Regional"
    public_ip_dns           = "ploceuspublicip000002"
    idle_timeout_in_minutes = "30"
    zones                   = ["1"]
    edge_zone               = null
    public_ip_prefix_id     = null
    reverse_fqdn            = null
    ip_tags                 = null
    public_ip_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}
#NIC
nic_variables = {
  "nic_1" = {
    name                                             = "ploceusnic000001"
    resource_group_name                              = "ploceusrg000001"
    location                                         = "westus2"
    internal_dns_name_label                          = null
    enable_ip_forwarding                             = null
    enable_accelerated_networking                    = null
    dns_servers                                      = null
    ip_configuration_name                            = "ipconfig1"
    subnet_name                                      = "ploceussubnet000001"
    vnet_name                                        = "ploceusvnet000001"
    is_gateway_load_balancer_required_to_be_attached = false
    is_public_required                               = true
    public_ip_name                                   = "ploceuspublicip000001"
    private_ip_address_version                       = "IPv4"
    private_ip_address_allocation                    = "Dynamic"
    private_ip_address                               = null
    primary                                          = true
    nic_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  },
  "nic_2" = {
    name                                             = "ploceusnic000002"
    resource_group_name                              = "ploceusrg000001"
    location                                         = "westus2"
    internal_dns_name_label                          = null
    enable_ip_forwarding                             = null
    enable_accelerated_networking                    = null
    dns_servers                                      = null
    ip_configuration_name                            = "ipconfig1"
    subnet_name                                      = "ploceussubnet000002"
    vnet_name                                        = "ploceusvnet000001"
    is_gateway_load_balancer_required_to_be_attached = false
    is_public_required                               = true
    public_ip_name                                   = "ploceuspublicip000002"
    private_ip_address_version                       = "IPv4"
    private_ip_address_allocation                    = "Dynamic"
    private_ip_address                               = null
    primary                                          = true
    nic_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

#NSG
network_security_group_variable = {
  #NSG with none security rules
  "network_security_group_1" = {
    name                = "ploceusnsg000001"
    resource_group_name = "ploceusrg000001"
    location = "westus2"
    security_rule       = []
    network_security_group_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  },
  "network_security_group_2" = {
    name                = "ploceusnsg000002"
    resource_group_name = "ploceusrg000001"
    location = "westus2"
    security_rule       = []
    network_security_group_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  },
  "network_security_group_3" = {
    name                = "ploceusnsg000003"
    resource_group_name = "ploceusrg000001"
    location = "westus2"
    security_rule       = []
    network_security_group_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  },
  "network_security_group_4" = {
    name                = "ploceusnsg000004"
    resource_group_name = "ploceusrg000001"
    location = "westus2"
    security_rule       = []
    network_security_group_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

network_security_group_association = {
  "network_security_group_association_1" = {
    nic_security_group_association = [
      {
        network_interface_name  = "ploceusnic000001"
        network_security_group_name = "ploceusnsg000001"
        resource_group_name = "ploceusrg000001"
      }
    ]
    subnet_security_group_association = null
  },
  "network_security_group_association_2" = {
    nic_security_group_association = null
    subnet_security_group_association = [
      {
        network_security_group_name = "ploceusnsg000002"
        resource_group_name = "ploceusrg000001"
        subnet_name = "ploceussubnet000001"
        vnet_name = "ploceusvnet000001"
      }
    ]
  },
  "network_security_group_association_3" = {
    nic_security_group_association = [
      {
        network_interface_name = "ploceusnic000002"
        network_security_group_name = "ploceusnsg000003"
        resource_group_name = "ploceusrg000001"
      }
    ],
    subnet_security_group_association = [
      {
        network_security_group_name = "ploceusnsg000004"
        resource_group_name = "ploceusrg000001"
        subnet_name = "ploceussubnet000002"
        vnet_name = "ploceusvnet000001"
      }
    ]
  }
}
