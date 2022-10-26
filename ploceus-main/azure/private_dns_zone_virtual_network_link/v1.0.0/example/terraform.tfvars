#RESOURCE GROUP 
resource_group_variables = {
  "resource_group_1" = {
    name     = "ploceusrg000002"
    location = "westus2"
    resource_group_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

#PRIVATE DNS ZONE
private_dns_zones = {
  "dns_1 " = {
    name                = "ploceusprivatedns00001.com"
    resource_group_name = "ploceusrg000002"
    soa_record_enabled  = true
    soa_record = {
      email        = " XXXXXXXXXXX@neudesic.com" #This value is required if soa_record_enabled is set to true
      expire_time  = null               #Default value is 2419200
      minimum_ttl  = null               #Default value is 10
      refresh_time = null               #Default value is 3600
      retry_time   = null               #Default value is 300
      ttl          = null               #Default value is 3600
      soa_tags = {
        Created_By = "Ploceus",
        Department = "CIS"
      }
    }
    tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
  "dns_2 " = {
    name                = "ploceusprivatedns00002.com"
    resource_group_name = "ploceusrg000002"
    soa_record_enabled  = false
    soa_record = {
      email        = null
      expire_time  = null
      minimum_ttl  = null
      refresh_time = null
      retry_time   = null
      ttl          = null
    soa_tags = {} }
    tags = {
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
    resource_group_name         = "ploceusrg000002"
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

#PRIVATE DNS ZONE VIRTUAL NETWORK LINK
private_dns_zone_virtual_network_links = {
  virtual_network_link_1 = {
    name                  = "ploceusvnetlink000001a"
    private_dns_zone_name = "ploceusprivatedns00001.com"
    resource_group_name   = "ploceusrg000002"
    virtual_network_name  = "ploceusvnet000001a"
    registration_enabled  = false #default value is false
    tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}