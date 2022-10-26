variable "traffic_manager_external_endpoint_variables" {
  type = map(object({
    name              = string
    target            = string
    weight            = string
    enabled           = bool
    endpoint_location = string
    priority          = string
    geo_mappings      = list(string)
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
