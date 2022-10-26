
variable "desktop_scaling_plan_variables" {
  type = map(object({
    scaling_plan_name                = string
    scaling_plan_resource_group_name = string
    friendly_name                    = string
    description                      = string
    time_zone                        = string
    tags                             = map(string)
    host_pool = object({
      host_pool_name                = string
      scaling_plan_enabled          = bool
      host_pool_resource_group_name = string
    })
    schedule = object({
      name         = string
      days_of_week = list(string)
      ramp_up = object({
        start_time                 = string
        load_balancing_algorithm   = string
        minimum_hosts_percent      = number
        capacity_threshold_percent = number
      })
      peak = object({
        start_time               = string
        load_balancing_algorithm = string
      })
      ramp_down = object({
        start_time                 = string
        load_balancing_algorithm   = string
        minimum_hosts_percent      = number
        force_logoff_users         = bool
        wait_time_minutes          = number
        notification_message       = string
        capacity_threshold_percent = number
        stop_hosts_when            = string
      })
      off_peak = object({
        start_time               = string
        load_balancing_algorithm = string
      })
    })
  }))
  default     = {}
  description = "scaling plans"
}

