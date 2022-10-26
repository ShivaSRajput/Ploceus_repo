data "azurerm_storage_container" "storage_container" {
  for_each             = var.subscription_cost_management_export_variables
  name                 = each.value.storage_container_name
  storage_account_name = each.value.storage_account_name
}

resource "azurerm_subscription_cost_management_export" "subscription_cost_management_export" {
  for_each                     = var.subscription_cost_management_export_variables
  name                         = each.value.cost_management_export_name
  subscription_id              = "/subscriptions/${each.value.subscription_id}"
  recurrence_type              = each.value.recurrence_type
  recurrence_period_start_date = each.value.recurrence_period_start_date
  recurrence_period_end_date   = each.value.recurrence_period_end_date
  active                       = each.value.active
  export_data_storage_location {
      container_id     = data.azurerm_storage_container.storage_container[each.key].resource_manager_id
      root_folder_path = each.value.export_data_storage_location_root_folder_path
 }
  export_data_options {
      type       = each.value.export_data_options_type
      time_frame = each.value.export_data_options_time_frame
 }
}
