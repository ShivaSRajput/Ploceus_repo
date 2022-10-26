locals {
  is_public_ip_exists = { for k, v in var.application_gateway_variables : k => v if lookup(v, "is_public_fronted_ip_required", false) == true }

  default_waf_configuration = {
    firewall_mode    = "Prevention"
    rule_set_type    = "OWASP"
    rule_set_version = "3.1"
    enabled          = true
  }
  default_sku = {
    name     = "WAF_v2"
    tier     = "WAF_v2"
    capacity = 2
  }

}

locals {
  is_waf_policy_exists = { for k, v in var.application_gateway_variables : k => v if lookup(v, "is_waf_policy_required", false) == true }
}


data "azurerm_virtual_network" "vnet_id" {
  for_each            = var.application_gateway_variables
  name                = each.value.vnet_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_subnet" "subnet_id" {
  for_each             = var.application_gateway_variables
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "public_ip" {
  for_each            = local.is_public_ip_exists
  name                = each.value.public_ip_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_web_application_firewall_policy" "waf_policy_id" {
  for_each            = local.is_waf_policy_exists
  name                = each.value.waf_policy_name
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_application_gateway" "application_gateway" {
  for_each            = var.application_gateway_variables
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location

  dynamic "sku" {
    for_each = lookup(each.value, "sku", null) == null ? [local.default_sku] : [merge(local.default_sku, each.value.sku)]
    content {
      name     = sku.value.name
      tier     = sku.value.tier
      capacity = sku.value.capacity
    }
  }

  dynamic "autoscale_configuration" {
    for_each = each.value["autoscale_configuration"] != null ? [each.value["autoscale_configuration"]] : []
    content {
      min_capacity = autoscale_configuration.value.min_capacity
      max_capacity = autoscale_configuration.value.max_capacity
    }
  }
  gateway_ip_configuration {
    name      = each.value.gateway_ip_configuration_name
    subnet_id = data.azurerm_subnet.subnet_id[each.key].id
  }


  dynamic "frontend_port" {
    for_each = coalesce(lookup(each.value, "frontend_ports"), [])
    content {
      name = frontend_port.value.name
      port = coalesce(frontend_port.value.port, 443)
    }
  }


  frontend_ip_configuration {
    name                          = each.value.frontend_ip_configuration_name
    subnet_id                     = each.value.is_private_fronted_ip_required == false ? null : data.azurerm_subnet.subnet_id[each.key].id
    private_ip_address            = each.value.private_ip_address
    public_ip_address_id          = each.value.is_public_fronted_ip_required == false ? null : data.azurerm_public_ip.public_ip[each.key].id
    private_ip_address_allocation = each.value.private_ip_address_allocation
  }

  dynamic "backend_address_pool" {
    for_each = coalesce(lookup(each.value, "backend_address_pools"), [])
    content {
      name         = backend_address_pool.value.name
      fqdns        = lookup(backend_address_pool.value, "fqdns", null)
      ip_addresses = lookup(backend_address_pool.value, "ip_addresses", null)
    }
  }

  dynamic "backend_http_settings" {
    for_each = coalesce(lookup(each.value, "backend_http_settings"), [])
    content {
      name                                = backend_http_settings.value.name
      cookie_based_affinity               = coalesce(backend_http_settings.value.cookie_based_affinity, "Disabled")
      path                                = backend_http_settings.value.path
      port                                = coalesce(backend_http_settings.value.port, 443)
      protocol                            = coalesce(backend_http_settings.value.protocol, "Https")
      request_timeout                     = coalesce(backend_http_settings.value.request_timeout, 20)
      probe_name                          = lookup(backend_http_settings.value, "probe_name", null)
      host_name                           = coalesce(backend_http_settings.value.pick_host_name_from_backend_address, false) == false ? lookup(backend_http_settings.value, "host_name", null) : null
      pick_host_name_from_backend_address = coalesce(backend_http_settings.value.pick_host_name_from_backend_address, false)
      trusted_root_certificate_names      = coalesce(backend_http_settings.value.protocol, "Https") == "Https" ? lookup(each.value, "trusted_root_certificate_names", null) : null
    }
  }


  dynamic "http_listener" {
    for_each = coalesce(lookup(each.value, "http_listeners"), [])
    content {
      name                           = http_listener.value.name
      frontend_ip_configuration_name = http_listener.value.frontend_ip_configuration_name
      frontend_port_name             = http_listener.value.frontend_port_name
      protocol                       = coalesce(http_listener.value.protocol, "Https")
      ssl_certificate_name           = lookup(http_listener.value, "ssl_certificate_name", null)
      require_sni                    = coalesce(http_listener.value.sni_required, false)
      host_name                      = (coalesce(http_listener.value.listener_type, "Basic") == "MultiSite" && http_listener.value.host_names == null) ? http_listener.value.host_name : null
      host_names                     = (coalesce(http_listener.value.listener_type, "Basic") == "MultiSite" && http_listener.value.host_name == null) ? http_listener.value.host_names : null
      firewall_policy_id             = lookup(http_listener.value, "firewall_policy_id", null)
    }
  }


  dynamic "request_routing_rule" {
    for_each = coalesce(lookup(each.value, "request_routing_rules"), [])
    content {
      name                        = request_routing_rule.value.name
      rule_type                   = coalesce(request_routing_rule.value.rule_type, "Basic")
      http_listener_name          = request_routing_rule.value.listener_name
      backend_address_pool_name   = request_routing_rule.value.redirect_configuration_name == null ? lookup(request_routing_rule.value, "backend_address_pool_name", null) : null
      backend_http_settings_name  = request_routing_rule.value.redirect_configuration_name == null ? lookup(request_routing_rule.value, "backend_http_settings_name", null) : null
      redirect_configuration_name = (request_routing_rule.value.backend_http_settings_name == null && request_routing_rule.value.backend_address_pool_name == null) ? lookup(request_routing_rule.value, "redirect_configuration_name", null) : null
      url_path_map_name           = coalesce(request_routing_rule.value.rule_type, "Basic") == "PathBasedRouting" ? request_routing_rule.value.url_path_map_name : null
      rewrite_rule_set_name       = lookup(request_routing_rule.value, "rewrite_rule_set_name", null)
    }
  }

  dynamic "url_path_map" {
    for_each = coalesce(lookup(each.value, "url_path_maps"), [])
    content {
      name                                = url_path_map.value.name
      default_backend_http_settings_name  = url_path_map.value.default_redirect_configuration_name == null ? lookup(url_path_map.value, "default_backend_http_settings_name", null) : null
      default_backend_address_pool_name   = url_path_map.value.default_redirect_configuration_name == null ? lookup(url_path_map.value, "default_backend_address_pool_name", null) : null
      default_redirect_configuration_name = (url_path_map.value.default_backend_http_settings_name == null && url_path_map.value.default_backend_address_pool_name == null) ? lookup(url_path_map.value, "default_redirect_configuration_name", null) : null
      default_rewrite_rule_set_name       = lookup(url_path_map.value, "default_rewrite_rule_set_name", null)
      dynamic "path_rule" {
        for_each = coalesce(lookup(url_path_map.value, "path_rules"), [])
        content {
          name                        = path_rule.value.name
          paths                       = path_rule.value.paths
          backend_address_pool_name   = path_rule.value.redirect_configuration_name == null ? lookup(path_rule.value, "backend_address_pool_name", null) : null
          backend_http_settings_name  = path_rule.value.redirect_configuration_name == null ? lookup(path_rule.value, "backend_http_settings_name", null) : null
          redirect_configuration_name = (path_rule.value.backend_http_settings_name == null && path_rule.value.backend_address_pool_name == null) ? lookup(path_rule.value, "redirect_configuration_name", null) : null
          rewrite_rule_set_name       = lookup(path_rule.value, "rewrite_rule_set_name", null)
        }
      }
    }
  }

  dynamic "redirect_configuration" {
    for_each = coalesce(lookup(each.value, "redirect_configurations"), [])
    content {
      name                 = redirect_configuration.value.name
      redirect_type        = coalesce(redirect_configuration.value.redirect_type, "Permanent")
      target_listener_name = redirect_configuration.value.target_url == null ? lookup(redirect_configuration.value, "target_listener_name", null) : null
      target_url           = redirect_configuration.value.target_listener_name == null ? lookup(redirect_configuration.value, "target_url", null) : null
      include_path         = coalesce(redirect_configuration.value.include_path, false)
      include_query_string = coalesce(redirect_configuration.value.include_query_string, false)
    }
  }


  dynamic "waf_configuration" {
    for_each = [local.default_waf_configuration]
    content {
      firewall_mode    = waf_configuration.value.firewall_mode
      rule_set_type    = waf_configuration.value.rule_set_type
      rule_set_version = waf_configuration.value.rule_set_version
      enabled          = waf_configuration.value.enabled
    }
  }

  dynamic "probe" {
    for_each = coalesce(lookup(each.value, "probes"), [])
    content {
      name                                      = probe.value.name
      path                                      = probe.value.path
      protocol                                  = coalesce(probe.value.protocol, "Https")
      interval                                  = coalesce(probe.value.interval, 30)
      timeout                                   = coalesce(probe.value.timeout, 30)
      unhealthy_threshold                       = coalesce(probe.value.unhealthy_threshold, 3)
      host                                      = coalesce(probe.value.pick_host_name_from_backend_http_settings, false) == false ? probe.value.host : null
      pick_host_name_from_backend_http_settings = coalesce(probe.value.pick_host_name_from_backend_http_settings, false)
    }
  }

  dynamic "redirect_configuration" {
    for_each = coalesce(lookup(each.value, "redirect_configurations"), [])
    content {
      name                 = redirect_configuration.value.name
      redirect_type        = coalesce(redirect_configuration.value.redirect_type, "Permanent")
      target_listener_name = redirect_configuration.value.target_url == null ? lookup(redirect_configuration.value, "target_listener_name", null) : null
      target_url           = redirect_configuration.value.target_listener_name == null ? lookup(redirect_configuration.value, "target_url", null) : null
      include_path         = coalesce(redirect_configuration.value.include_path, false)
      include_query_string = coalesce(redirect_configuration.value.include_query_string, false)
    }
  }

  tags = merge(each.value.application_gateway_tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
  lifecycle { ignore_changes = [tags["Created_Time"]] }
}




