#RESOURCE GROUP VARIABLES
variable "resource_group_variables" {
  description = "Map of Resource groups"
  type = map(object({
    name                = string
    location            = string
    resource_group_tags = map(string)
  }))
  default = {}
}

variable "traffic_manager_profile_variables" {
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


variable "traffic_manager_nested_endpoint_variables" {
  type = map(object({
    name                                  = string
    minimum_child_endpoints               = string
    target_resource_id                    = string
    weight                                = string
    enabled                               = bool
    endpoint_location                     = string
    minimum_required_child_endpoints_ipv4 = string
    minimum_required_child_endpoints_ipv6 = string
    priority                              = string
    geo_mappings                          = list(string)
    custom_header = list(object({
      name  = string
      value = string
    }))
    subnet = list(object({
      first = string
      last  = string
      scope = string
    }))
    profile_name        = string
    profile_rg          = string
    nested_profile_name = string
    nested_profile_rg   = string
  }))
}
