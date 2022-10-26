output "log_analytics_linked_service_ids" {
  description = "log analytics linked service outputs"
  value = [
    for k, v in azurerm_log_analytics_linked_service.log_analytics_linked_service :
    {
      name                            = k
      id                              = v.id
    }
  ]
}
