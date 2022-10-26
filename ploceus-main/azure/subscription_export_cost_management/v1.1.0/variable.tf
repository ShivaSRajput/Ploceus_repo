variable "subscription_cost_management_export_variables" {

  type = map(object({
    cost_management_export_name                   = string
    subscription_id                               = string
    storage_account_name                          = string
    storage_container_name                        = string
    recurrence_type                               = string
    recurrence_period_start_date                  = string
    recurrence_period_end_date                    = string
    export_data_storage_location_root_folder_path = string
    export_data_options_type                      = string
    export_data_options_time_frame                = string
    active                                        = bool
  }))
}
