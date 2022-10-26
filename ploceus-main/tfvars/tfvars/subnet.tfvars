subnet_variables = {
  "subnet_1" = {
    name                                           = "ploceussubnet000001a"
    resource_group_name                            = "ploceusrg000001"
    address_prefixes                               = ["10.0.1.0/24"]
    virtual_network_name                           = "ploceusvnet000001a"
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
    virtual_network_name                           = "ploceusvnet000001a"
    enforce_private_link_service_network_policies  = false                                                                                                                                                    #Setting this to true will Disable the policy
    enforce_private_link_endpoint_network_policies = false                                                                                                                                                    #Setting this to true will Disable the policy
    service_endpoints                              = ["Microsoft.AzureActiveDirectory"]                                                                                                                       #update this field if service endpoint is required
    is_delegetion_required                         = false                                                                                                                                                    #update to true if delegation required and update delegation name,service_name,Service_actions
    delegation_name                                = "delegation000002"                                                                                                                                       #Update this field if delgation required
    service_name                                   = "Microsoft.Databricks/workspaces"                                                                                                                        #Update this field if delgation required
    service_actions                                = ["Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action", "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"] #Update this field if delgation required
  }
}