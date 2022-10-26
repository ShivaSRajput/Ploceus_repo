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

#Subnets
subnet_variables = {
  "subnet_1" = {
    name                                           = "ploceussubnet000001a"
    resource_group_name                            = "ploceusrg000001"
    address_prefixes                               = ["10.0.1.0/24"]
    virtual_network_name                           = "ploceusvnet000001"
    enforce_private_link_service_network_policies  = true
    enforce_private_link_endpoint_network_policies = true
    is_delegetion_required                         = false #update to true if delegation required and update delegation name,service_name,Service_actions
    service_endpoints                              = ["Microsoft.AzureActiveDirectory"]
    delegation_name                                = "delegation000001"
    service_name                                   = "Microsoft.Sql/managedInstances"
    service_actions                                = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action", "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"]
  },
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

load_balancers_variables = {
  "lb2" = {
    load_balancer_edge_zone           = null
    load_balancer_location            = "westus2"
    load_balancer_name                = "ploceuslb000002"
    load_balancer_resource_group_name = "ploceusrg000001"
    load_balancer_sku                 = "Gateway"
    load_balancer_sku_tier            = "Regional"
    load_balancer_tags = {
      "Created_By" = "Ploceus"
      Department   = "CIS"
    }
    load_balancer_frontend_ip_configuration = {
      "config1" = {
        frontend_ip_configuration_gateway_load_balancer_frontend_ip_configuration_id = {
          gateway_load_balancer_name                = null
          gateway_load_balancer_resource_group_name = null
        }
        frontend_ip_configuration_name                          = "ploceuslbfe000003"
        frontend_ip_configuration_private_ip_address            = null
        frontend_ip_configuration_private_ip_address_allocation = "Dynamic"
        frontend_ip_configuration_private_ip_address_version    = "IPv4"
        frontend_ip_configuration_public_ip_address_id = {
          public_ip_name                = null
          public_ip_resource_group_name = null
        }
        frontend_ip_configuration_public_ip_prefix_id = {
          public_ip_prefix_name                = null
          public_ip_prefix_resource_group_name = null
        }
        frontend_ip_configuration_subnet = {
          subnet_name                    = "ploceussubnet000001a"
          subnet_virtual_network_name    = "ploceusvnet000001"
          virtual_network_resource_group = "ploceusrg000001"
        }
        frontend_ip_configuration_zones = null
      },
      "config2" = {
        frontend_ip_configuration_gateway_load_balancer_frontend_ip_configuration_id = {
          gateway_load_balancer_name                = null
          gateway_load_balancer_resource_group_name = null
        }
        frontend_ip_configuration_name                          = "ploceuslbfe000004"
        frontend_ip_configuration_private_ip_address            = null
        frontend_ip_configuration_private_ip_address_allocation = "Dynamic"
        frontend_ip_configuration_private_ip_address_version    = "IPv4"
        frontend_ip_configuration_public_ip_address_id = {
          public_ip_name                = null
          public_ip_resource_group_name = null
        }
        frontend_ip_configuration_public_ip_prefix_id = {
          public_ip_prefix_name                = null
          public_ip_prefix_resource_group_name = null
        }
        frontend_ip_configuration_subnet = {
          subnet_name                    = "ploceussubnet000001a"
          subnet_virtual_network_name    = "ploceusvnet000001"
          virtual_network_resource_group = "ploceusrg000001"
        }
        frontend_ip_configuration_zones = null
      },
    }
  }
}

load_balancer_backendpool_variables = {
  backendpool_2 = {
    load_balancer_backendpool_name                      = "ploceuslbbp000002"
    load_balancer_name                                  = "ploceuslb000002"
    load_balancer_resource_group_name                   = "ploceusrg000001"
    load_balancer_backendpool_tunnel_interface_required = true
    load_balancer_backendpool_tunnel_interface_variables = {
      "tunnel_1" = {
        load_balancer_backendpool_tunnel_interface_identifier = 901
        load_balancer_backendpool_tunnel_interface_type       = "Internal"
        load_balancer_backendpool_tunnel_interface_protocol   = "VXLAN"
        load_balancer_backendpool_tunnel_interface_port       = 15002
      }
    }
  },
  backendpool_3 = {
    load_balancer_backendpool_name                      = "ploceuslbbp000003"
    load_balancer_name                                  = "ploceuslb000002"
    load_balancer_resource_group_name                   = "ploceusrg000001"
    load_balancer_backendpool_tunnel_interface_required = true
    load_balancer_backendpool_tunnel_interface_variables = {
      "tunnel_1" = {
        load_balancer_backendpool_tunnel_interface_identifier = 902
        load_balancer_backendpool_tunnel_interface_type       = "External"
        load_balancer_backendpool_tunnel_interface_protocol   = "VXLAN"
        load_balancer_backendpool_tunnel_interface_port       = 15003
      }
    }
  }
}

load_balancer_rule_variables = {
  loadbalancerrules1 = {
    load_balancer_rule_name                           = "ploceuslbrule000001"
    load_balancer_name                                = "ploceuslb000002"
    load_balancer_resource_group_name                 = "ploceusrg000001"
    load_balancer_subscription_id                     = "7900acc5-1983-4d78-b269-42fd92f1b2b0" # Mark as null if load_balancer_rule_probe_name is null
    load_balancer_rule_frontend_ip_configuration_name = "ploceuslbfe000003"
    load_balancer_rule_backend_pool_names             = ["ploceuslbbp000002", "ploceuslbbp000003"] # 2 Backend Pool Names allowed if LB SKU is Gateway, else 1 for Basic and Standard
    load_balancer_rule_protocol                       = "All"
    load_balancer_rule_frontend_port                  = "0"
    load_balancer_rule_backend_port                   = "0"
    load_balancer_rule_enable_floating_ip             = false
    load_balancer_rule_disable_outbound_snat          = false
    load_balancer_rule_enable_tcp_reset               = false
    load_balancer_rule_load_distribution              = "SourceIPProtocol"
    load_balancer_rule_idle_timeout_in_minutes        = 4
    load_balancer_rule_probe_name                     = "ploceuslbprobe000001" # Optional, mark as null if not needed
  }
}

load_balancer_probe_variables = {
  "probe-1" = {
    load_balancer_name                      = "ploceuslb000002"
    load_balancer_resource_group_name       = "ploceusrg000001"
    load_balancer_probe_name                = "ploceuslbprobe000001"
    load_balancer_probe_port                = 3389
    load_balancer_probe_protocol            = "Tcp"
    load_balancer_probe_request_path        = null
    load_balancer_probe_interval            = 5
    load_balancer_probe_unhealthy_threshold = 2
  }
}
