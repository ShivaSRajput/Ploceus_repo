#windows VDI App Groups Variable
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
