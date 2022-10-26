#Firewall_nat_rule_collection
resource "azurerm_firewall_nat_rule_collection" "firewall_nat_rule_collection" {
  for_each                           = var.firewall_nat_rule_collection_variables
  name                               = each.value.name
  resource_group_name                = each.value.resource_group_name
  azure_firewall_name                = each.value.azure_firewall_name 
  priority                           = each.value.priority == null ? "Regular" : each.value.priority
  action                             = each.value.action

  dynamic "rule" {
    for_each = each.value.rule != null ? toset(each.value.rule) : []
    content {
    name                             = rule.value.name
    description                      = rule.value.description
    source_addresses                 = rule.value.source_addresses
    source_ip_groups                 = rule.value.source_ip_groups
    destination_ports                = rule.value.destination_ports
    destination_addresses            = rule.value.destination_addresses
    protocols                        = rule.value.protocols
    translated_address               = rule.value.translated_address
    translated_port                  = rule.value.translated_port
   }
  }
}