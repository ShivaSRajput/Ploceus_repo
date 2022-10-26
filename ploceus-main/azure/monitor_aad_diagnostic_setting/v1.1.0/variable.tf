variable "diagnostic_settings" {
  type = map(object({
    diagnostic_setting_name = string
    eventhub_name           = string
    eventhub_authorization_rule = object({
      eventhub_authrule_name       = string
      eventhub_namespace           = string
      eventhub_resource_group_name = string
    })
    log_analytics_workspace = object({
      log_analytics_name                = string
      log_analytics_resource_group_name = string
    })
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
  }))
  default = {}
}
