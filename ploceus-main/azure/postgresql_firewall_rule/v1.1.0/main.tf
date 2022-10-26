resource "azurerm_postgresql_firewall_rule" "postgresql_firewall_rule" {
  for_each            = var.postgresql_firewall_rule_variables
  name                = each.value.postgresql_firewall_rule_name
  resource_group_name = each.value.postgresql_firewall_rule_resource_group_name
  server_name         = each.value.postgresql_firewall_rule_server_name
  start_ip_address    = each.value.postgresql_firewall_rule_start_ip_address
  end_ip_address      = each.value.postgresql_firewall_rule_end_ip_address
}
