#windows VDI App Groups Variable
variable "traffic_manager_profiles" {
  type = map(object({
    name                   = string
    resource_group_name    = string
    traffic_routing_method = string
    profile_status         = string
    traffic_view_enabled   = bool
    max_return             = number
    dns_config_ttl         = number
    monitor_config = object({
      protocol                     = string
      port                         = number
      path                         = string
      interval_in_seconds          = number
      timeout_in_seconds           = number
      tolerated_number_of_failures = number
      expected_status_code_ranges  = list(string)
      custom_header                = map(string)
    })
    tags = map(string)
  }))
}
