#Firewall Network Rules
output "firewall_network_rule_collection" {
  value = { for k, v in azurerm_firewall_network_rule_collection.firewall_network_rule_collection : k => v.id }
  description = "Firewall network rule collection outputs"
}