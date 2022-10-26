#variables monitor log profiles
variable "monitor_log_profiles" {
  type = map(object({
    monitor_log_name = string
    categories       = list(string)
    locations        = list(string)
    storage_account = object({
      storage_account_name                = string
      storage_account_resource_group_name = string
    })
    servicebus_rule = object({
      servicebus_type                = string #can only contains eventhub, servicebus, null
      servicebus_name                = string
      servicebus_namespace           = string
      servicebus_resource_group_name = string
    })

    retention_policy = object({
      enabled = bool
      days    = number
    })
  }))
  default = {}
  validation {
    condition     = (contains([for k, v in var.monitor_log_profiles : contains(["eventhub", "servicebus", "null"], coalesce(v.servicebus_rule.servicebus_type, "null"))], false)) == false
    error_message = "servicebus_rule => servicebus_type must contains ('eventhub','servicebus',null) only"
  }
}
