variable "traffic_manager_endpoint_variables" {
  type = map(object({
    name                = string
    resource_group_name = string
    weight              = string
    enabled             = bool
    geo_mappings        = list(string)
    target_resource_id  = string
    priority            = string
    custom_header = list(object({
      name  = string
      value = string
    }))
    subnet = list(object({
      first = string
      last  = string
      scope = string
    }))
    profile_name = string
    profile_rg   = string
  }))
}
