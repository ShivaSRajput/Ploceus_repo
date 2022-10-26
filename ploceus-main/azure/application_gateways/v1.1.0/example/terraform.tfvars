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
  }
}

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
  }
}

#PUBLIC IP
public_ip_variables = {
  "public_ip_1" = {
    name                    = "ploceuspublicip000002a"
    resource_group_name     = "ploceusrg000001"
    location                = "westus2"
    ip_version              = "IPv4"
    allocation_method       = "Static"
    sku                     = "Standard"
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

#APPLICATION GATEWAY 
application_gateway_variables = {
  "application_gateway_1" = {
    name                              = "ploceusapgw000002"
    resource_group_name               = "ploceusrg000001"
    location                          = "westus2"
    sku_name                          = "Standard_v2"
    sku_tier                          = "Standard_v2"
    sku_capacity                      = 1
    gateway_ip_configuration_name     = "apgw000002-gicconfig"
    vnet_name                         = "ploceusvnet000001a"
    subnet_name                       = "ploceussubnet000001a"
    frontend_port_name                = "apgw000002-feip"
    frontend_port                     = 80
    is_private_fronted_ip_required    = false
    is_public_fronted_ip_required     = true
    public_ip_name                    = "ploceuspublicip000002a"
    fips_enabled                      = false
    identity                          = null
    zones                             = ["1", "3"]
    trusted_client_certificate        = null
    authentication_certificate        = null
    trusted_root_certificate          = null
     firewall_policy_id                = null #"/subscriptions/f49f85f2-bead-4d78-9915-faec304b4783/resourceGroups/test-app/providers/Microsoft.Network/firewallPolicies/test_firewall_policy" 
    custom_error_configuration        = null
    force_firewall_policy_association = false # Is the Firewall Policy associated with the Application Gateway?
    enable_http2                      = false # defaults to false

    sku = {
      name     = "WAF_v2"
      tier     = "WAF_v2"
      capacity = null
    }

    gateway_ip_configuration = [{
      name      = "apgw000002-gicconfig"
      subnet_id = "ploceussubnet000001a"
    }]

    waf_configuration = [{
      firewall_mode            = "Prevention"
      rule_set_type            = "OWASP"
      rule_set_version         = "3.1"
      file_upload_limit_mb     = "100"
      max_request_body_size_kb = "127"
      request_body_check       = true
      enabled                  = true
      disabled_rule_group = {
        rule_group_name = "crs_20_protocol_violations"
      }
      exclusion = {
        match_variable          = "RequestHeaderNames"
        selector_match_operator = "StartsWith"
        selector                = "RequestHeaderNames"
      }
    }]
    frontend_ports = [
      {
        name = "appgateway-feporthttp"
        port = 80
      },
      {
        name = "appgateway-feport8080"
        port = 8080
      }
    ]

    backend_address_pools = [
      {
        name         = "appgateway-beap"
        fqdns        = null
        ip_addresses = null
      }
    ]

    autoscale_configuration = {
      min_capacity = 5
      max_capacity = 10
    }
    backend_http_settings = [
      {
        name                                = "http-be-htst"
        path                                = "/"
        port                                = 8443
        protocol                            = "Http"
        cookie_based_affinity               = "Enabled"
        affinity_cookie_name                = "ploceuscookie000001"
        request_timeout                     = 20
        probe_name                          = "http-bc-prob"
        host_name                           = "hostname.com"
        pick_host_name_from_backend_address = false
        trusted_root_certificate_names      = ["backendcookies", "ploceuscookies"]
        authentication_certificate = [{
          name = "ploceus_auth_certificate"
        }]
        connection_draining = [{
          enabled           = true
          drain_timeout_sec = "100"
        }]
      }
    ]
    frontend_ip_configuration = [{
      name                            = "apgw000002-feipconfig"
      private_ip_address              = null
      private_ip_address_allocation   = null
      private_link_configuration_name = null
      is_private_fronted_ip_required  = true
      is_public_fronted_ip_required   = true
    }]
    http_listener = [
      {
        name                           = "http-bc-lstn"
        frontend_ip_configuration_name = "apgw000002-feipconfig"
        frontend_port_name             = "appgateway-feporthttp"
        protocol                       = "Http"
        ssl_certificate_name           = null
        sni_required                   = false
        listener_type                  = "MultiSite"
        host_name                      = "hostname.com"
        host_names                     = null
        firewall_policy_id             =  null#"/subscriptions/f49f85f2-bead-4d78-9915-faec304b4783/resourceGroups/test-app/providers/Microsoft.Network/firewallPolicies/test_firewall_policy"
        ssl_profile_name               = null
        custom_error_configuration = [{
          status_code           = "HttpStatus403"
          custom_error_page_url = "Http/customerror403"
        }]
      },
      {
        name                           = "http-bc-lstn2"
        frontend_ip_configuration_name = "apgw000002-feipconfig"
        frontend_port_name             = "appgateway-feport8080"
        protocol                       = "Http"
        ssl_certificate_name           = null
        sni_required                   = false
        listener_type                  = "MultiSite"
        host_name                      = "hostname2.com"
        host_names                     = null
        firewall_policy_id             =  null#"/subscriptions/f49f85f2-bead-4d78-9915-faec304b4783/resourceGroups/test-app/providers/Microsoft.Network/firewallPolicies/test_firewall_policy"
        ssl_profile_name               = null
        custom_error_configuration = [{
          status_code           = "HttpStatus502"
          custom_error_page_url = "Http/customerror502"
        }]
      }
    ]
    request_routing_rules = [
      {
        name                        = "http-bc-rqrt"
        rule_type                   = "PathBasedRouting"
        listener_name               = "http-bc-lstn"
        backend_address_pool_name   = null
        backend_http_settings_name  = null
        rewrite_rule_set_name       = null
        redirect_configuration_name = null
        priority                    = "10"
        url_path_map_name           = "urlpathbasedmaps"

      }
    ]
    url_path_maps = [{
      name                                = "urlpathbasedmaps"
      default_backend_http_settings_name  = null
      default_backend_address_pool_name   = null
      default_redirect_configuration_name = "bc-rconfig"
      default_rewrite_rule_set_name       = null
      path_rules = [{
        name                        = "mytheartrule"
        paths                       = ["/*"]
        backend_http_settings_name  = null
        backend_address_pool_name   = null
        redirect_configuration_name = "bc-rconfig"
        rewrite_rule_set_name       = null
      }]
    }]
    private_link_configuration = null
    probe = [
      {
        name                                      = "http-bc-prob"
        path                                      = "/"
        protocol                                  = "Http"
        host                                      = "hostname.com"
        port                                      = "80"
        minimum_servers                           = "4"
        interval                                  = null
        timeout                                   = null
        unhealthy_threshold                       = null
        pick_host_name_from_backend_http_settings = false
        match = [{
          body        = "Error occured due to autherization failure"
          status_code = ["HttpError403"]
        }]
      }
    ]
    redirect_configurations = [
      {
        name                 = "bc-rconfig"
        redirect_type        = "Permanent"
        target_listener_name = "http-bc-lstn2"
        target_url           = null
        include_path         = true
        include_query_string = true
      }
    ]
    disabled_ssl_protocols                  = null
    trusted_root_certificate_names          = null
    ssl_certificate_names                   = null
    key_vault_with_private_endpoint_enabled = true
    ssl_profile                             = null
    ssl_policy                              = null
    ssl_certificate                         = null
    rewrite_rule_set                        = null

    application_gateway_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}
