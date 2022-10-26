output "cognitive_services_id" {
  value = values(azurerm_cognitive_account.cognitive_services)[*].id
}
