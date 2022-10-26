data "azurerm_firewall_policy" "azure_firewall_policy" {
  for_each            = var.firewall_policy_rule_collection_group_variables
  name                = each.value.firewall_policy_name
  resource_group_name = each.value.firewall_policy_rule_collection_group_resource_group_name
}

resource "azurerm_firewall_policy_rule_collection_group" "firewall_policy_rule_collection_group" {
  for_each           = var.firewall_policy_rule_collection_group_variables
  name               = each.value.firewall_policy_rule_collection_group_name
  firewall_policy_id = data.azurerm_firewall_policy.azure_firewall_policy[each.key].id
  priority           = each.value.priority
  dynamic "application_rule_collection" {
    for_each = each.value.application_rule_collection != null ? toset(each.value.application_rule_collection) : []
    content {
      name     = application_rule_collection.value["name"]
      action   = application_rule_collection.value["action"]
      priority = application_rule_collection.value["priority"]
      dynamic "rule" {
        for_each = application_rule_collection.value["rule"] != null ? toset(application_rule_collection.value["rule"]) : []
        content {
          name             = rule.value["name"]
          description      = rule.value["description"]
          source_addresses = rule.value["source_addresses"]
          source_ip_groups = rule.value["source_ip_groups"]

          destination_addresses = rule.value["destination_addresses"]

          destination_urls      = rule.value["destination_addresses"] == null ? rule.value["destination_urls"] : null
          destination_fqdns     = rule.value["destination_fqdns"]
          destination_fqdn_tags = rule.value["destination_fqdn_tags"]
          terminate_tls         = rule.value["terminate_tls"]
          web_categories        = rule.value["web_categories"]
          dynamic "protocols" {
            for_each = rule.value["protocols"] != null ? toset(rule.value["protocols"]) : []
            content {
              type = protocols.value["type"]
              port = protocols.value["port"]
            }
          }

        }

      }
    }
  }




  dynamic "network_rule_collection" {
    for_each = each.value.network_rule_collection != null ? toset(each.value.network_rule_collection) : []
    content {
      name     = network_rule_collection.value["name"]
      action   = network_rule_collection.value["action"]
      priority = network_rule_collection.value["priority"]
      dynamic "rule" {
        for_each = network_rule_collection.value["rule"] != null ? toset(network_rule_collection.value["rule"]) : []
        content {
          name                  = rule.value["name"]
          protocols             = rule.value["protocols"]
          destination_ports     = rule.value["destination_ports"]
          source_addresses      = rule.value["source_addresses"]
          source_ip_groups      = rule.value["source_ip_groups"]
          destination_addresses = rule.value["destination_addresses"]
          destination_ip_groups = rule.value["destination_ip_groups"]
          destination_fqdns     = rule.value["destination_fqdns"]
        }
      }
    }
  }
  dynamic "nat_rule_collection" {
    for_each = each.value.nat_rule_collection != null ? toset(each.value.nat_rule_collection) : []
    content {
      name     = nat_rule_collection.value["name"]
      action   = nat_rule_collection.value["action"]
      priority = nat_rule_collection.value["priority"]
      dynamic "rule" {
        for_each = nat_rule_collection.value["rule"] != null ? toset(nat_rule_collection.value["rule"]) : []
        content {
          name                = rule.value["name"]
          protocols           = rule.value["protocols"]
          destination_ports   = rule.value["destination_ports"]
          source_addresses    = rule.value["source_addresses"]
          source_ip_groups    = rule.value["source_ip_groups"]
          destination_address = rule.value["destination_address"]
          translated_address  = rule.value["translated_address"]
          translated_fqdn     = rule.value["translated_fqdn"]
          translated_port     = rule.value["translated_port"]
        }
      }
    }
  }
}

