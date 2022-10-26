
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

# All variables that need to be included in tags
tags = {
  automated_by = "Dipak"
}
# All variables for search service
search_service = {
  "service1" = {
    name                          = "ploceussearchservice000001"
    resource_group_name           = "ploceusrg000001"
    resource_group_location       = "eastus"
    sku                           = "standard" #basic, free, standard, standard2, standard3, storage_optimized_l1 and storage_optimized_l2
    replica_count                 = "1"
    partition_count               = "1"
    public_network_access_enabled = false # true means public access, false means private access for that we need private endpoint        
    assign_identity               = false



  }
}

# All variables for private endpoints

private_endpoints = {
  pe1 = {
    is_manual_connection           = false
    resource_group_name            = "ploceusrg000001"
    location                       = "westus2"
    private_connection_resource_id = "xxxxxxxx"
    subresource_names              = ["searchService"]
    request_message                = null
    name                           = "ploceupvtendpoint000001"
    tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }

}



#VNET
vnets_variables = {
  "vnet_1" = {
    vnet_name           = "ploceusvnet000001"
    location            = "westus2"
    resource_group_name = "ploceusrg000001"
    address_space       = ["10.0.0.0/16"]
    dns_servers         = []

    is_ddos_protection_required = false #Provide the value as true only if ddos_protection_plan is required
    ddos_protection_plan_name   = null  #Provide the name of the ddos protection plan if above value is true or else keep it as null. If new DDOS protection plan needs to be created uncomment from line 24 to 34
    vnet_tags = {
      Created_By = "SE PAttern team",
      Department = "CIS"
    }
  }
}

#SUBNET
subnet_variables = {
  "subnet_1" = {
    subnet_name                                    = "ploceussubnet000001"
    resource_group_name                            = "ploceusrg000001"
    address_prefixes                               = ["10.0.1.0/24"]
    virtual_network_name                           = "ploceusvnet000001"
    enforce_private_link_service_network_policies  = false
    enforce_private_link_endpoint_network_policies = false
  }
}

# keyvault_name         = "keyvaultPE"
# keyvault_resourcegroup= "ploceusrg000001"

