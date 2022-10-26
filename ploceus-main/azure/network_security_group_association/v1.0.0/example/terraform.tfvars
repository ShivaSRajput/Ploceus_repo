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
  },
  "subnet_2" = {
    name                 = "ploceussubnet000002"
    resource_group_name  = "ploceusrg000001"
    address_prefixes     = ["10.0.2.0/24"]
    virtual_network_name = "ploceusvnet000001"
  }
}

#PUBLIC IP
public_ip_variable = {
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
    availability_zone       = "1"
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
    availability_zone       = "1"
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
    private_ip_address_allocation                    = "dynamic"
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
    private_ip_address_allocation                    = "dynamic"
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
    security_rule       = []
    network_security_group_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  },
  "network_security_group_2" = {
    name                = "ploceusnsg000002"
    resource_group_name = "ploceusrg000001"
    security_rule       = []
    network_security_group_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  },
  "network_security_group_3" = {
    name                = "ploceusnsg000003"
    resource_group_name = "ploceusrg000001"
    security_rule       = []
    network_security_group_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  },
  "network_security_group_4" = {
    name                = "ploceusnsg000004"
    resource_group_name = "ploceusrg000001"
    security_rule       = []
    network_security_group_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

#NSG Association
nsg_association_variable = {
  "nsg_association_variable_1" = {
    nic_association = [
      {
        nic_name            = "ploceusnic000001"
        nsg_to_associate    = "ploceusnsg000001"
        resource_group_name = "ploceusrg000001"
      }
    ]
    subnet_association = null
  },
  "nsg_association_variable_2" = {
    nic_association = null
    subnet_association = [
      {
        vnet_name           = "ploceusvnet000001"
        snet_name           = "ploceussubnet000001"
        nsg_to_associate    = "ploceusnsg000002"
        resource_group_name = "ploceusrg000001"
      }
    ]
  },
  "nsg_association_variable_3" = {
    nic_association = [
      {
        nic_name            = "ploceusnic000002"
        nsg_to_associate    = "ploceusnsg000003"
        resource_group_name = "ploceusrg000001"
      }
    ],
    subnet_association = [
      {
        vnet_name           = "ploceusvnet000001"
        snet_name           = "ploceussubnet000002"
        nsg_to_associate    = "ploceusnsg000004"
        resource_group_name = "ploceusrg000001"
      }
    ]
  }
}
