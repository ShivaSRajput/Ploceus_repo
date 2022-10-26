
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
    address_space               = ["11.0.0.0/16"]
    dns_servers                 = []
    flow_timeout_in_minutes     = null  #possible values are between 4 and 30 minutes.
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

#FIREWALL VARIABLE
firewall_variables = {
  "firewall_1" = {
    name                                             = "ploceusfirewall000001"
    resource_group_name                              = "ploceusrg000001"
    location                                         = "eastus"
    vnet_name                                        = "vnet1"
    subnet_name                                      = "subnet1"
    sku_name                                         = "AZFW_VNet"
    sku_tier                                         = "Premium"
    zones                                            = [1, 2]
    policy_id                                        = "/subscriptions/f49f85f2-bead-4d78-9915-faec304b4783/resourceGroups/test-app/providers/Microsoft.Network/firewallPolicies/test_firewall_policy"
    dns_servers                                      = null
    private_ip_ranges                                = null
    management_ip_enabled                            = false # Enable only if management IP is required and provide values below as string.
    management_ip_configuration_name                 = "test"
    # Only works with AzureFirewallManagementSubnet with /26 subnet mask
    management_ip_configuration_subnet_id            = "/subscriptions/070e769c-b870-488d-ad31-3707ced9fedf/resourceGroups/mb-az-400/providers/Microsoft.Network/virtualNetworks/test/subnets/AzureFirewallManagementSubnet"
    # Only works with Static IP address and Standard SKU
    management_ip_configuration_public_ip_address_id = "/subscriptions/070e769c-b870-488d-ad31-3707ced9fedf/resourceGroups/mb-az-400/providers/Microsoft.Network/publicIPAddresses/test"
    threat_intel_mode                                = "Alert" # Possible values are Off, Alert, Deny
    virtual_hub_enabled                              = false # Enable only if virtual hub is required and provide values below
    virtual_hub_id                                   = null
    public_ip_count                                  = null
    additional_public_ips = [
       {
        ip_configuration_name  = ""
        public_ip_address_name = ""
        subnet_name            = ""
        vnet_name              = ""
        resource_group_name    = ""
      }
    ]

    tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}
