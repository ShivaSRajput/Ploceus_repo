output "cost_management_export_id" {
  value = [
    for k, v in var.subscription_cost_management_export_variables :
    {
      id = resource.azurerm_subscription_cost_management_export.subscription_cost_management_export[k].id
    }
  ]
}