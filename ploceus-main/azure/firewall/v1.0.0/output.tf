output "azure_firewall_id" {
  value = { for k, v in azurerm_firewall.firewall : k => v.id }
}
