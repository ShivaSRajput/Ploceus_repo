output "search_id" {
  value = values(azurerm_search_service.search_service)[*].id
}
