#Firewall_application_rule_collection
resource "azurerm_firewall_application_rule_collection" "firewall_app_rule_collection" {
  for_each            = var.firewall_application_rule_collection_variables
  name                = each.value.firewall_application_rule_collection_name
  azure_firewall_name = each.value.firewall_application_rule_collection_azure_firewall_name
  resource_group_name = each.value.firewall_application_rule_collection_resource_group_name
  priority            = each.value.firewall_application_rule_collection_priority
  action              = each.value.firewall_application_rule_collection_action
  dynamic "rule" {
    for_each = each.value.firewall_rule != null ? toset(each.value.firewall_rule) : []
    content {
      name             = rule.value.rule_name
      description      = rule.value.rule_description
      source_addresses = rule.value.rule_source_addresses
      source_ip_groups = rule.value.rule_source_ip_groups
      target_fqdns     = rule.value.rule_target_fqdns
      fqdn_tags        = rule.value.rule_fqdn_tags
      dynamic "protocol" {
        for_each = rule.value.protocol != null ? toset(rule.value.protocol) : []
        content {
          type = protocol.value.protocol_type
          port = protocol.value.protocol_port
        }
      }
    }
  }
}
