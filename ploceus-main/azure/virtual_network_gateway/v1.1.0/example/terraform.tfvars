#RESOURCE GROUP 
resource_group_variables = {
  "resource_group_1" = {
    name     = "ploceusrg00003"
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
    name                        = "ploceusvnet00003"
    location                    = "westus2"
    resource_group_name         = "ploceusrg00003"
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

#Subnets
subnet_variables = {
  "subnet_1" = {
    name                                           = "GatewaySubnet" #Should not change
    resource_group_name                            = "ploceusrg00003"
    address_prefixes                               = ["10.0.1.0/24"]
    virtual_network_name                           = "ploceusvnet00003"
    enforce_private_link_service_network_policies  = true
    enforce_private_link_endpoint_network_policies = true
    is_delegetion_required                         = false #update to true if delegation required and update delegation name,service_name,Service_actions
    service_endpoints                              = ["Microsoft.AzureActiveDirectory"]
    delegation_name                                = "delegation000001"
    service_name                                   = "Microsoft.Sql/managedInstances"
    service_actions                                = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action", "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"]
  }
}

#PUBLIC IP
public_ip_variables = {
  "public_ip_1" = {
    name                    = "ploceuspip00003"
    resource_group_name     = "ploceusrg00003"
    location                = "westus2"
    ip_version              = "IPv4"
    allocation_method       = "Dynamic"
    sku                     = "Basic"
    sku_tier                = "Regional"
    public_ip_dns           = "ploceuspublicip000002a"
    public_ip_prefix_id     = null
    idle_timeout_in_minutes = "30"
    zones                   = ["1", "3"]
    edge_zone               = null
    reverse_fqdn            = null
    ip_tags                 = null
    public_ip_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}


#Local Network Gateway

local_network_gateway_variables = {
  "lgn_1" = {
    name                 = "ploceuslng000001"
    location             = "westus2"
    resource_group_name  = "ploceusrg00003"
    gateway_address      = "49.37.67.201" #Either gateway_address or gateway_fqdn should be specified. So please use null for the one not being used.
    gateway_fqdn         = null           #Either gateway_address or gateway_fqdn should be specified. So please use null for the one not being used.
    address_space        = ["10.0.0.0/16"]
    bgp_settings_enabled = false
    asn                  = null
    bgp_peering_address  = ""
    peer_weight          = null
    tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}


#VIRTUAL NETWORK GATEWAY VARIABLES
virtual_network_gateway_variables = {
  "vng_1" = {
    name                               = "ploceusvng00003"
    location                           = "westus2"
    resource_group_name                = "ploceusrg00003"
    type                               = "Vpn" #Valid options are Vpn or ExpressRoute
    vpn_type                           = null #Use null incase of unknown
    active_active                      = false
    enable_bgp                         = false
    sku                                = "Standard"
    default_local_network_gateway_name = "ploceuslng000001" #local network gateway
    edge_zone                          = null #Use null incase of unknown
    generation                         = null #Use null incase of unknown
    tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
    private_ip_address_enabled = false
    #An active-standby gateway requires exactly one ip_configuration block, 
    #an active-active gateway requires exactly two ip_configuration blocks 
    #an active-active zone redundant gateway with P2S configuration requires exactly three ip_configuration blocks 
    ip_configuration = [{
      name                          = "ploceusvngip00003"
      private_ip_address_allocation = "Dynamic" #Valid options are Static or Dynamic
      public_ip_address_name        = "ploceuspip00003"
      vnet_name                     = "ploceusvnet00003"
    }]
    bgp_settings = [{
      asn = null
      #peering_addresses = ""
      #Only one peering_addresses block can be specified except when active_active of this Virtual Network Gateway is true
      peering_addresses = [{
        ip_configuration_name = "ploceusvngip00003"
        apipa_addresses       = [] #The valid range for the reserved APIPA address in Azure Public is from 169.254.21.0 to 169.254.22.255.
      }]
      peer_weight = null
    }]
    vpn_client_configuration_enabled = false
    vpn_client_configuration = [{
      address_space                    = ""
      vpn_auth_types                   = [""]
      vpn_client_protocols             = [""]
      aad_audience                     = "" # The client id of the Azure VPN application. Need to check for id from data
      aad_issuer                       = ""
      aad_tenant                       = ""
      radius_server_address            = ""
      radius_server_secret             = ""
      root_certificate_enabled         = false
      root_revoked_certificate_enabled = false
      root_certificate = [{
        name             = ""
        public_cert_data = ""
      }]
      root_revoked_certificate = [{
        name             = ""
        public_cert_data = ""
      }]
    }]
    custom_route_enabled = false
    custom_route = [{
      address_prefixes = [""]
    }]
  }
}