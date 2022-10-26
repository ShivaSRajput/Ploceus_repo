#VNET
vnets_variables = {
  "vnet_1" = {
    name                = "ploceusvnet000003"
    location            = "westus2"
    resource_group_name = "ploceus"
    address_space       = ["12.0.0.0/16"]
    dns_servers         = []

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
#     name                            = "ploceusddosplan000002"
#     location                        = "westus2"
#     resource_group_name             = "ploceus"
#     ddos_protection_plan_tags = {
#       Created_By = "Ploceus",
#       Department = "CIS"
#     }
#   }
# }

#SUBNET
subnet_variables = {
  "subnet_1" = {
    name                 = "ploceussubnet000003"
    resource_group_name  = "ploceus"
    address_prefixes     = ["12.0.1.0/24"]
    virtual_network_name = "ploceusvnet000003"
  }
}



#AZURE FRONT DOOR CLUSTER
azure_front_door = {
  "azure_front_door_1" = {
    vnet_name = "ploceusvnet000003" #Optional parameter - Use only if specific subnet needs to be defined for Kubernetes cluster, if not keep it as null
    azure_front_door_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}
