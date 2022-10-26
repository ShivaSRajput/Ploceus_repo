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

#VNET uncomment to create Vnet
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
  },
   "vnet_2" = {
    name                        = "ploceusvnet000002a"
    location                    = "westus2"
    resource_group_name         = "ploceusrg000001"
    address_space               = ["10.1.0.0/16"]
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
#    "ddos_plan_1" = {
#      name                            = "ploceusddosplan000001"
#      location                        = "westus2"
#      resource_group_name             = "ploceusrg000001"
#      ddos_protection_plan_tags = {
#       Created_By = "Ploceus",
#       Department = "CIS"
#     }
#   }
# }


virtual_network_peering_variables = {
  "peer1" = {
    vnet_peering_name                = "ploceusvnetpeer1"
    duplex_enabled                   = false
    destination_resource_group_name  = "ploceusrg000001"
    destination_virtual_network_name = "ploceusvnet000002a"
    source_resource_group_name       = "ploceusrg000001"
    source_virtual_network_name      = "ploceusvnet000001a"
    allow_virtual_network_access     = true
    allow_forwarded_traffic          = true
    use_remote_gateways              = false
    allow_gateway_transit            = false
  }
}

/*Source Subscription and Destination Subscription ID to be same 
in case of same subscription VNET Peering
Source Subscription and Destination Subscription ID to be different
in case of different subscription VNET Peering
*/

source_subscription_id      = "070e769c-b870-488d-ad31-3707ced9fedf"
source_tenant_id            = "687f51c3-0c5d-4905-84f8-97c683a5b9d1"
destination_subscription_id = "070e769c-b870-488d-ad31-3707ced9fedf"
destination_tenant_id       = "687f51c3-0c5d-4905-84f8-97c683a5b9d1"