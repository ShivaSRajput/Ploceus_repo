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
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    dns_servers         = list(string)

    is_ddos_protection_required = bool
    ddos_protection_plan_name   = string
    vnet_tags                   = map(string)
  }))
  default = {}
}

#Subnet Variables
variable "subnet_variables" {
  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))
  default = {}
}

#Variables for public IP
variable "public_ip_variable" {
  type = map(object({
    name                    = string
    resource_group_name     = string
    location                = string
    ip_version              = string
    allocation_method       = string
    sku                     = string
    sku_tier                = string
    public_ip_dns           = string
    idle_timeout_in_minutes = string
    availability_zone       = string
    reverse_fqdn            = string
    ip_tags                 = map(string)
    public_ip_tags          = map(string)
  }))
}

#APPLICATION GATEWAY VARIABLE
variable "application_gateway_variables" {
  type = map(object({
    name                           = string
    resource_group_name            = string
    location                       = string
    sku_name                       = string
    sku_tier                       = string
    sku_capacity                   = number
    gateway_ip_configuration_name  = string
    vnet_name                      = string
    subnet_name                    = string
    frontend_port_name             = string
    frontend_port                  = number
    frontend_ip_configuration_name = string
    is_private_fronted_ip_required = bool
    private_ip_address             = string
    is_public_fronted_ip_required  = bool
    public_ip_name                 = string
    private_ip_address_allocation  = string
    application_gateway_tags       = map(string)


    sku = object({
      name     = string
      tier     = string
      capacity = number
    })

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
    }))

    http_listeners = list(object({
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
    }))

    request_routing_rules = list(object({
      name                        = string
      rule_type                   = string
      listener_name               = string
      backend_address_pool_name   = string
      backend_http_settings_name  = string
      redirect_configuration_name = string
      url_path_map_name           = string
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
    waf_configuration = object({
      firewall_mode    = string
      rule_set_type    = string
      rule_set_version = number
      enabled          = bool
    })

    probes = list(object({
      name                                      = string
      path                                      = string
      interval                                  = number
      protocol                                  = string
      timeout                                   = number
      unhealthy_threshold                       = number
      host                                      = string
      pick_host_name_from_backend_http_settings = bool
    }))
    redirect_configurations = list(object({
      name                 = string
      redirect_type        = string
      target_listener_name = string
      target_url           = string
      include_path         = bool
      include_query_string = bool
    }))

  }))
}
