data "azurerm_log_analytics_workspace" "log_analytics_workspace" {
  for_each = var.firewall_policy_variables
  name     = each.value.insights.default_log_analytics_workspace_name

  resource_group_name = each.value.resource_group_name
}

resource "azurerm_firewall_policy" "firewall_policy" {
  for_each            = var.firewall_policy_variables
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  base_policy_id      = each.value.base_policy_id
  dns {
    proxy_enabled = each.value.dns.proxy_enabled
    servers       = each.value.dns.servers
  }
  identity {
    type         = each.value.identity.type
    identity_ids = each.value.identity.ids
  }
  insights {
    enabled                            = each.value.insights.enabled
    default_log_analytics_workspace_id = data.azurerm_log_analytics_workspace.log_analytics_workspace[each.key].id
    retention_in_days                  = each.value.insights.retention_in_days
    dynamic "log_analytics_workspace" {
      for_each = each.value.insights.log_analytics_workspace
      content {
        firewall_location = log_analytics_workspace.value["firewall_location"]
        id                = log_analytics_workspace.value["id"]
      }


    }

  }
  intrusion_detection {
    mode = each.value.intrusion_detection.mode
    dynamic "signature_overrides" {
      for_each = each.value.intrusion_detection.signature_overrides
      content {
        id    = signature_overrides.value["id"]
        state = signature_overrides.value["state"]
      }

    }
    dynamic "traffic_bypass" {
      for_each = each.value.intrusion_detection.traffic_bypass
      content {
        name                  = traffic_bypass.value["name"]
        protocol              = traffic_bypass.value["protocol"]
        description           = traffic_bypass.value["description"]
        destination_addresses = traffic_bypass.value["destination_addresses"]
        destination_ip_groups = traffic_bypass.value["destination_ip_groups"]
        destination_ports     = traffic_bypass.value["destination_ports"]
        source_addresses      = traffic_bypass.value["source_addresses"]
        source_ip_groups      = traffic_bypass.value["source_ip_groups"]

      }

    }

  }
  private_ip_ranges = each.value.private_ip_ranges
  sku               = each.value.sku
  tags              = each.value.tags
  threat_intelligence_allowlist {
    fqdns        = each.value.threat_intelligence_allowlist.fqdns
    ip_addresses = each.value.threat_intelligence_allowlist.ip_addresses

  }
  tls_certificate {
    key_vault_secret_id = each.value.tls_certificate.key_vault_secret_id
    name                = each.value.tls_certificate.name
  }
}
