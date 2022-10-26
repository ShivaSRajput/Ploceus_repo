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
    name                = "ploceusvnet00001"
    location            = "westus2"
    resource_group_name = "ploceusrg000001"
    address_space       = ["10.1.0.0/16"]
    dns_servers         = []

    is_ddos_protection_required = false #Provide the value as true only if ddos_protection_plan is required
    ddos_protection_plan_name   = null  #Provide the name of the ddos protection plan if above value is true or else keep it as null.
    vnet_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

#SUBNET
subnet_variables = {
  "subnet_1" = {
    name                 = "ploceussubnet000001"
    resource_group_name  = "ploceusrg000001"
    address_prefixes     = ["10.1.0.0/24"]
    virtual_network_name = "ploceusvnet00001"
  }
}

#PUBLIC IP
public_ip_variable = {
  "public_ip_1" = {
    name                    = "ploceuspublicip000001"
    resource_group_name     = "ploceusrg000001"
    location                = "westus2"
    ip_version              = "IPv4"
    allocation_method       = "Static"
    sku                     = "Standard"
    sku_tier                = "Regional"
    public_ip_dns           = "ploceuspublicip000001"
    idle_timeout_in_minutes = "30"
    availability_zone       = "1"
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
    name                           = "ploceusapgw000002"
    resource_group_name            = "ploceusrg000001"
    location                       = "westus2"
    sku_name                       = "Standard_v2"
    sku_tier                       = "Standard_v2"
    sku_capacity                   = 1
    gateway_ip_configuration_name  = "apgw000002-gicconfig"
    vnet_name                      = "ploceusvnet00001"
    subnet_name                    = "ploceussubnet000001"
    frontend_port_name             = "apgw000002-feip"
    frontend_port                  = 80
    frontend_ip_configuration_name = "apgw000002-feipconfig"
    is_private_fronted_ip_required = false
    private_ip_address             = null
    is_public_fronted_ip_required  = true
    public_ip_name                 = "ploceuspublicip000001"
    private_ip_address_allocation  = null

    sku = {
      name     = "WAF_v2"
      tier     = "WAF_v2"
      capacity = null
    }

    waf_configuration = {
      firewall_mode    = "Prevention"
      rule_set_type    = "OWASP"
      rule_set_version = "3.1"
      enabled          = true
    }
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
        request_timeout                     = 20
        probe_name                          = "http-bc-prob"
        host_name                           = "hostname.com"
        pick_host_name_from_backend_address = false
      }
    ]
    http_listeners = [
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
        firewall_policy_id             = null
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
        firewall_policy_id             = null
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
    probes = [
      {
        name                                      = "http-bc-prob"
        path                                      = "/"
        protocol                                  = "Http"
        host                                      = "hostname.com"
        interval                                  = null
        timeout                                   = null
        unhealthy_threshold                       = null
        pick_host_name_from_backend_http_settings = false
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
    waf_configuration                       = null
    disabled_ssl_protocols                  = null
    trusted_root_certificate_names          = null
    ssl_certificate_names                   = null
    key_vault_with_private_endpoint_enabled = true

    application_gateway_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}


