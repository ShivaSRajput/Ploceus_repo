output "firewall_application_rule_collection_id" {
  value       =  { for k, v in azurerm_firewall_application_rule_collection.firewall_app_rule_collection : k => v.id }
  description = "Firewall application rule collection output"
}
