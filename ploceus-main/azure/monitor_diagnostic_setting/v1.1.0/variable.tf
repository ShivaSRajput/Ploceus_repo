#windows Monitor Diagnostics Settings Variable definition
variable "diagnostic_settings" {
  type = map(object({
    diagnostics_setting_name = string
    target_resource = object({
      target_resource_name       = string
      target_resource_group_name = string
      to_append                  = string #Used for appending ths sub resource ID part (example storage ID + Blob sub part ID). For no sub resource use ""
    })
    eventhub_name = string
    eventhub_authorization_rule = object({
      eventhub_authrule_name       = string
      eventhub_namespace           = string
      eventhub_resource_group_name = string
    })
    log_analytics_workspace = object({
      log_analytics_name                = string
      log_analytics_resource_group_name = string
    })
    log_analytics_destination_type = string
    storage_account = object({
      storage_account_name                = string
      storage_account_resource_group_name = string
    })
    log = map(object({
      category = string

      retention_policy = object({
        enabled = bool
        days    = number
      })
      enabled = bool
    }))
    metric = map(object({
      category = string

      retention_policy = object({
        enabled = bool
        days    = number
      })
      enabled = bool
    }))
  }))
  default = {}
}
