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

#SUBNET
subnet_variables = {
  "subnet_1" = {
    name                 = "ploceussnet000001"
    resource_group_name  = "ploceusrg000001"
    address_prefixes     = ["10.0.1.0/24"]
    virtual_network_name = "ploceusvnet000001"
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

load_balancers = {
  loadbalancer1 = {
    name                   = "ploceuslb000001"
    lb_resource_group_name = "ploceusrg000001"
    sku                    = "Standard"
    frontend_ip_config = [
      {
        name              = "ploceuslbfe000001"
        subnet_name       = "ploceussnet000001"
        vnet_name         = "ploceusvnet000001"
        static_ip         = null # "10.0.1.4" #(Optional) Set null to get dynamic IP 
        availability_zone = "Zone-Redundant"
      },
      {
        name              = "ploceuslbfe000002"
        subnet_name       = "ploceussnet000001"
        vnet_name         = "ploceusvnet000001"
        static_ip         = null # "10.0.1.4" #(Optional) Set null to get dynamic IP
        availability_zone = "Zone-Redundant"
      }
    ]
    public_ip_name = null
    lb_tags        = { created_by = "Ploceus" }
  },
  loadbalancer2 = {
    name                   = "ploceuslb000002"
    sku                    = "Standard"
    lb_resource_group_name = "ploceusrg000001"
    frontend_ip_config = [
      {
        name              = "ploceuslbfe000003"
        subnet_name       = "ploceussnet000001"
        vnet_name         = "ploceusvnet000001"
        static_ip         = null # "10.0.1.4" #(Optional) Set null to get dynamic IP 
        availability_zone = null
      },
      {
        name              = "ploceuslbfe000004"
        subnet_name       = "ploceussnet000001"
        vnet_name         = "ploceusvnet000001"
        static_ip         = null # "10.0.1.4" #(Optional) Set null to get dynamic IP
        availability_zone = null
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

