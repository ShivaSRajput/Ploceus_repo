locals {
  is_public_ip_exists = { for k, v in var.application_gateway_variables : k => v if lookup(v, "is_public_fronted_ip_required", false) == true }

  waf_configuration = {
    firewall_mode    = "Prevention"
    rule_set_type    = "OWASP"
    rule_set_version = "3.1"
    enabled          = true
    disabled_rule_group = [{
      rule_group_name = "crs_20_protocol_violations"
    }]
    exclusion = [{
      match_variable          = "RequestHeaderNames"
      selector_match_operator = "StartsWith"
      selector                = "RequestHeaderNames"
    }]
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
  for_each                          = var.application_gateway_variables
  name                              = each.value.name
  resource_group_name               = each.value.resource_group_name
  location                          = each.value.location
  fips_enabled                      = each.value.fips_enabled
  zones                             = each.value.zones
  enable_http2                      = each.value.enable_http2
  force_firewall_policy_association = each.value.force_firewall_policy_association

  dynamic "sku" {
    for_each = lookup(each.value, "sku", null) == null ? [local.default_sku] : [merge(local.default_sku, each.value.sku)]
    content {
      name     = sku.value.name
      tier     = sku.value.tier
      capacity = sku.value.capacity
    }
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  dynamic "trusted_client_certificate" {
    for_each = each.value.trusted_client_certificate != null ? each.value.trusted_client_certificate : []
    content {
      name = trusted_client_certificate.value.name
      data = trusted_client_certificate.value.data
    }
  }

  dynamic "authentication_certificate" {
    for_each = each.value.authentication_certificate != null ? each.value.authentication_certificate : []
    content {
      name = authentication_certificate.value.name
      data = authentication_certificate.value.data
    }
  }

  dynamic "autoscale_configuration" {
    for_each = each.value["autoscale_configuration"] != null ? [each.value["autoscale_configuration"]] : []
    content {
      min_capacity = autoscale_configuration.value.min_capacity
      max_capacity = autoscale_configuration.value.max_capacity
    }
  }
  dynamic "gateway_ip_configuration" {
    for_each = each.value.gateway_ip_configuration != null ? each.value.gateway_ip_configuration : []
    content {
      name      = each.value.gateway_ip_configuration_name
      subnet_id = data.azurerm_subnet.subnet_id[each.key].id
    }
  }

  dynamic "trusted_root_certificate" {
    for_each = each.value.trusted_root_certificate != null ? each.value.trusted_root_certificate : []
    content {
      name                = trusted_root_certificate.value.name
      data                = trusted_root_certificate.value.data
      key_vault_secret_id = trusted_root_certificate.value.key_vault_secret_id
    }
  }

  dynamic "frontend_port" {
    for_each = coalesce(lookup(each.value, "frontend_ports"), [])
    content {
      name = frontend_port.value.name
      port = coalesce(frontend_port.value.port, 443)
    }
  }


  dynamic "frontend_ip_configuration" {
    for_each = each.value.frontend_ip_configuration != null ? each.value.frontend_ip_configuration : []
    content {
      name                            = frontend_ip_configuration.value.name
      subnet_id                       = frontend_ip_configuration.value.is_private_fronted_ip_required == false ? null : data.azurerm_subnet.subnet_id[each.key].id
      private_ip_address              = frontend_ip_configuration.value.private_ip_address
      public_ip_address_id            = frontend_ip_configuration.value.is_public_fronted_ip_required == false ? null : data.azurerm_public_ip.public_ip[each.key].id
      private_ip_address_allocation   = frontend_ip_configuration.value.private_ip_address_allocation
      private_link_configuration_name = frontend_ip_configuration.value.private_link_configuration_name
    }
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
      affinity_cookie_name                = backend_http_settings.value.affinity_cookie_name
      dynamic "authentication_certificate" {
        for_each = each.value.authentication_certificate != null ? each.value.authentication_certificate : []
        content {
          name = authentication_certificate.value.sku_name
        }
      }
      dynamic "connection_draining" {
        for_each = coalesce(lookup(backend_http_settings.value, "connection_draining"), [])
        content {
          enabled           = connection_draining.value.enabled
          drain_timeout_sec = connection_draining.value.drain_timeout_sec
        }
      }
    }
  }


  dynamic "http_listener" {
    for_each = coalesce(lookup(each.value, "http_listener"), [])
    content {
      name                           = http_listener.value.name
      frontend_ip_configuration_name = http_listener.value.frontend_ip_configuration_name
      frontend_port_name             = http_listener.value.frontend_port_name
      ssl_profile_name               = http_listener.value.ssl_profile_name
      protocol                       = coalesce(http_listener.value.protocol, "Https")
      ssl_certificate_name           = lookup(http_listener.value, "ssl_certificate_name", null)
      require_sni                    = coalesce(http_listener.value.sni_required, false)
      host_name                      = (coalesce(http_listener.value.listener_type, "Basic") == "MultiSite" && http_listener.value.host_names == null) ? http_listener.value.host_name : null
      host_names                     = (coalesce(http_listener.value.listener_type, "Basic") == "MultiSite" && http_listener.value.host_name == null) ? http_listener.value.host_names : null
      firewall_policy_id             = lookup(http_listener.value, "firewall_policy_id", null)
      dynamic "custom_error_configuration" {
        for_each = coalesce(lookup(http_listener.value, "custom_error_configuration"), [])
        content {
          status_code           = custom_error_configuration.value.status_code
          custom_error_page_url = custom_error_configuration.value.custom_error_page_url
        }
      }
    }
  }

  dynamic "ssl_certificate" {
    for_each = each.value.ssl_certificate != null ? each.value.ssl_certificate : []
    content {
      name                = ssl_certificate.value.name
      key_vault_secret_id = ssl_certificate.key_vault_secret_id
    }
  }
  dynamic "request_routing_rule" {
    for_each = coalesce(lookup(each.value, "request_routing_rules"), [])
    content {
      name                        = request_routing_rule.value.name
      rule_type                   = coalesce(request_routing_rule.value.rule_type, "Basic")
      http_listener_name          = request_routing_rule.value.listener_name
      priority                    = request_routing_rule.value.priority
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
  dynamic "private_link_configuration" {
    for_each = each.value.private_link_configuration != null ? each.value.private_link_configuration : []
    content {
      name = private_link_configuration.value.name
      dynamic "ip_configuration" {
        for_each = each.value.ip_configuration != null ? each.value.ip_configuration : []
        content {
          name                          = ip_configuration.value.name
          subnet_id                     = each.value.is_private_fronted_ip_required == false ? null : data.azurerm_subnet.subnet_id[each.key].id
          private_ip_address_allocation = ip_configuration.value.private_ip_address_allocation
          primary                       = ip_configuration.value.primary
          private_ip_address            = ip_configuration.value.private_ip_address
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
    for_each = each.value.waf_configuration == null ? [] : toset(each.value.waf_configuration)
    content {
      firewall_mode            = waf_configuration.value.firewall_mode
      rule_set_type            = waf_configuration.value.rule_set_type
      rule_set_version         = waf_configuration.value.rule_set_version
      enabled                  = waf_configuration.value.enabled
      file_upload_limit_mb     = waf_configuration.value.file_upload_limit_mb
      request_body_check       = waf_configuration.value.request_body_check
      max_request_body_size_kb = waf_configuration.value.max_request_body_size_kb

      dynamic "disabled_rule_group" {
        for_each = waf_configuration.value.disabled_rule_group != null ? [waf_configuration.value.disabled_rule_group] : []
        content {
          rule_group_name = disabled_rule_group.value.rule_group_name
        }
      }
      dynamic "exclusion" {
        for_each = waf_configuration.value.exclusion != null ? [waf_configuration.value.exclusion] : []
        content {
          match_variable          = exclusion.value.match_variable
          selector_match_operator = exclusion.value.selector_match_operator
          selector                = exclusion.value.selector
        }
      }
    }
  }

  dynamic "probe" {
    for_each = each.value.probe != null ? each.value.probe : []
    content {
      name                                      = probe.value.name
      path                                      = probe.value.path
      port                                      = probe.value.port
      minimum_servers                           = probe.value.minimum_servers
      protocol                                  = coalesce(probe.value.protocol, "Https")
      interval                                  = coalesce(probe.value.interval, 30)
      timeout                                   = coalesce(probe.value.timeout, 30)
      unhealthy_threshold                       = coalesce(probe.value.unhealthy_threshold, 3)
      host                                      = coalesce(probe.value.pick_host_name_from_backend_http_settings, false) == false ? probe.value.host : null
      pick_host_name_from_backend_http_settings = coalesce(probe.value.pick_host_name_from_backend_http_settings, false)
      dynamic "match" {
        for_each = coalesce(lookup(probe.value, "match"), [])
        content {
          body        = match.value.body
          status_code = match.value.status_code
        }
      }
    }
  }
  dynamic "ssl_profile" {
    for_each = each.value.ssl_profile != null ? each.value.ssl_profile : []
    content {
      name                             = ssl_profile.value.name
      trusted_client_certificate_names = ssl_profile.value.trusted_client_certificate_names
      verify_client_cert_issuer_dn     = ssl_profile.value.verify_client_cert_issuer_dn
    }
  }
  dynamic "ssl_policy" {
    for_each = each.value.ssl_policy != null ? each.value.ssl_policy : []
    content {
      policy_name          = ssl_policy.value.name
      policy_type          = ssl_policy.value.policy_type
      cipher_suites        = ssl_policy.value.cipher_suites
      min_protocol_version = ssl_policy.value.min_protocol_version
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
  dynamic "rewrite_rule_set" {
    for_each = each.value.rewrite_rule_set != null ? each.value.rewrite_rule_set : []
    content {
      name = rewrite_rule_set.value.name
      dynamic "rewrite_rule" {
        for_each = each.value.rewrite_rule != null ? each.value.rewrite_rule : []
        content {
          name          = rewrite_rule.value.name
          rule_sequence = rewrite_rule.rule_sequence
          dynamic "condition" {
            for_each = each.value.condition != null ? each.value.condition : []
            content {
              variable    = condition.value.variable
              pattern     = condition.value.pattern
              ignore_case = condition.value.ignore_case
              negate      = condition.value.negate
            }
          }
          dynamic "response_header_configuration" {
            for_each = each.value.response_header_configuration != null ? each.value.response_header_configuration : []
            content {
              header_name  = response_header_configuration.value.header_name
              header_value = response_header_configuration.value.header_value
            }
          }
          dynamic "request_header_configuration" {
            for_each = each.value.request_header_configuration != null ? each.value.request_header_configuration : []
            content {
              header_name  = request_header_configuration.value.header_name
              header_value = request_header_configuration.value.header.value
            }
          }
          dynamic "url" {
            for_each = each.value.url != null ? each.value.url : []
            content {
              path         = url.value.path
              query_string = url.value.query_string
              reroute      = url.value.reroute
            }
          }
        }
      }
    }
  }

  tags = merge(each.value.application_gateway_tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
  lifecycle { ignore_changes = [tags["Created_Time"]] }
}




