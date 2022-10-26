#RESOURCE GROUP VARIABLES
variable "resource_group_variables" {
  description = "Map of Resource groups"
  type = map(object({
    name                = string
    location            = string
    resource_group_tags = map(string)
  }))
  default = {}
}

#VNET variable
variable "vnets_variables" {
  description = "Map of vnet objects. name, vnet_address_space, and dns_server supported"
  type = map(object({
    name                        = string
    location                    = string
    resource_group_name         = string
    address_space               = list(string)
    dns_servers                 = list(string)
    flow_timeout_in_minutes     = number
    bgp_community               = string
    is_ddos_protection_required = bool
    ddos_protection_plan_name   = string
    edge_zone                   = string
    vnet_tags                   = map(string)
  }))
  default = {}
}


#Subnet Variables
variable "subnet_variables" {
  type = map(object({
    name                                           = string
    resource_group_name                            = string
    virtual_network_name                           = string
    address_prefixes                               = list(string)
    enforce_private_link_service_network_policies  = bool
    enforce_private_link_endpoint_network_policies = bool
    service_endpoints                              = list(string)
    is_delegetion_required                         = bool
    delegation_name                                = string
    service_name                                   = string
    service_actions                                = list(string)
  }))
  default = {}
}

#Variables for public IP
variable "public_ip_variables" {
  type = map(object({
    name                    = string
    resource_group_name     = string
    location                = string
    ip_version              = string
    allocation_method       = string
    sku                     = string
    sku_tier                = string
    zones                   = list(string)
    edge_zone               = string
    public_ip_dns           = string
    idle_timeout_in_minutes = string
    reverse_fqdn            = string
    public_ip_prefix_id     = string
    ip_tags                 = map(string)
    public_ip_tags          = map(string)
  }))
}

#APPLICATION GATEWAY VARIABLE
variable "application_gateway_variables" {
  type = map(object({
    name                              = string
    resource_group_name               = string
    location                          = string
    sku_name                          = string
    sku_tier                          = string
    sku_capacity                      = number
    gateway_ip_configuration_name     = string
    vnet_name                         = string
    subnet_name                       = string
    frontend_port_name                = string
    frontend_port                     = number
    is_private_fronted_ip_required    = bool
    is_public_fronted_ip_required     = bool
    public_ip_name                    = string
    fips_enabled                      = bool
    firewall_policy_id                = string
    force_firewall_policy_association = bool
    zones                             = list(string)
    application_gateway_tags          = map(string)
    enable_http2                      = bool


    sku = object({
      name     = string
      tier     = string
      capacity = number
    })

    trusted_client_certificate = list(object({
      name = string
      data = string
    }))
    ssl_certificate = list(object({
      name                = string
      key_vault_secret_id = string
    }))

    authentication_certificate = list(object({
      name = string
      data = string
    }))

    trusted_root_certificate = list(object({
      name                = string
      key_vault_secret_id = string
      data                = string # required when keyvault secret id is not given
    }))

    identity = list(object({
      type         = string
      identity_ids = string
    }))

    private_link_configuration = list(object({
      name = string
      ip_configuration = list(object({
        subnet_id                     = string
        private_ip_address_allocation = string
        primary                       = bool
        private_ip_address            = string
        primary                       = bool
        private_ip_address            = string
      }))
    }))

    ssl_profile = list(object({
      name                             = string
      trusted_client_certificate_names = string
      verify_client_cert_issuer_dn     = string
    }))
    ssl_policy = list(object({
      name                 = string
      policy_type          = string
      cipher_suites        = string
      min_protocol_version = string
    }))

    autoscale_configuration = object({
      min_capacity = number
      max_capacity = number
    })

    frontend_ports = list(object({
      name = string
      port = number
    }))

    backend_address_pools = list(object({
      name         = string
      fqdns        = list(string)
      ip_addresses = list(string)
    }))

    backend_http_settings = list(object({
      name                                = string
      cookie_based_affinity               = string
      path                                = string
      port                                = number
      request_timeout                     = number
      probe_name                          = string
      protocol                            = string
      host_name                           = string
      pick_host_name_from_backend_address = bool
      affinity_cookie_name                = string
      trusted_root_certificate_names      = list(string)
      authentication_certificate = list(object({
        name = string
      }))
      connection_draining = list(object({
        enabled           = bool
        drain_timeout_sec = string
      }))
    }))
    gateway_ip_configuration = list(object({
      name      = string
      subnet_id = string
    }))

    frontend_ip_configuration = list(object({
      name                            = string
      private_ip_address              = string
      private_ip_address_allocation   = string
      private_link_configuration_name = string
      is_private_fronted_ip_required  = bool
      is_public_fronted_ip_required   = bool
    }))

    http_listener = list(object({
      name                           = string
      frontend_ip_configuration_name = string
      frontend_port_name             = string
      ssl_certificate_name           = string
      protocol                       = string
      sni_required                   = bool
      listener_type                  = string       # MultiSite or Basic
      host_name                      = string       # Required if listener_type = MultiSite and host_names = null
      host_names                     = list(string) # Required if listener_type = MultiSite and host_name = null
      firewall_policy_id             = string
      ssl_profile_name               = string
      custom_error_configuration = list(object({
        status_code           = string
        custom_error_page_url = string
      }))
    }))

    request_routing_rules = list(object({
      name                        = string
      rule_type                   = string
      listener_name               = string
      backend_address_pool_name   = string
      backend_http_settings_name  = string
      redirect_configuration_name = string
      url_path_map_name           = string
      priority                    = string
      rewrite_rule_set_name       = string
    }))

    url_path_maps = list(object({
      name                                = string
      default_backend_http_settings_name  = string
      default_backend_address_pool_name   = string
      default_redirect_configuration_name = string
      default_rewrite_rule_set_name       = string
      path_rules = list(object({
        name                        = string
        paths                       = list(string)
        backend_http_settings_name  = string
        backend_address_pool_name   = string
        redirect_configuration_name = string
        rewrite_rule_set_name       = string
      }))
    }))
    waf_configuration = list(object({
      firewall_mode            = string
      rule_set_type            = string
      rule_set_version         = number
      enabled                  = bool
      file_upload_limit_mb     = string
      request_body_check       = bool
      max_request_body_size_kb = string

      disabled_rule_group = object({
        rule_group_name = string
      })

      exclusion = object({
        match_variable          = string
        selector_match_operator = string
        selector                = string
      })
    }))

    probe = list(object({
      name                                      = string
      path                                      = string
      interval                                  = number
      protocol                                  = string
      timeout                                   = number
      unhealthy_threshold                       = number
      host                                      = string
      port                                      = string
      minimum_servers                           = string
      pick_host_name_from_backend_http_settings = bool
      match = list(object({
        body        = string
        status_code = list(string)
      }))
    }))
    redirect_configurations = list(object({
      name                 = string
      redirect_type        = string
      target_listener_name = string
      target_url           = string
      include_path         = bool
      include_query_string = bool
    }))
    rewrite_rule_set = list(object({
      name = string
      rewrite_rule = list(object({
        name          = string
        rule_sequence = string
        condition = list(object({
          variable    = string
          pattern     = string
          ignore_case = string
          negate      = string
        }))
        response_header_configuration = list(object({
          header_name  = string
          header_value = string
        }))
        request_header_configuration = list(object({
          header_name  = string
          header_value = string
        }))
        url = list(object({
          path         = string
          query_string = string
          reroute      = string
        }))
      }))
    }))

  }))
}
