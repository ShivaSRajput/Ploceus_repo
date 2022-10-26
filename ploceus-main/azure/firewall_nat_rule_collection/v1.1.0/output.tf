
#Firewall Nat Rules
output "firewall_nat_rule_collection" {
  value = { for k, v in azurerm_firewall_nat_rule_collection.firewall_nat_rule_collection : k => v.id }
  description = "Firewall network nat collection outputs"
}