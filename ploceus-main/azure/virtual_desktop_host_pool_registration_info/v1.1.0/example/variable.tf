#windows virtual_desktop_host_pool_registration_info Variable
variable "desktop_host_pool_registration_info_variables" {
  type = map(object({
    expiration_time               = string #"2022-01-01T23:40:52Z"
    host_pool_name                = string
    host_pool_resource_group_name = string
  }))
  default = {}
}


variable "resource_group_variables" {
  description = "Map of Resource groups"
  type = map(object({
    name                = string
    location            = string
    resource_group_tags = map(string)
  }))
  default = {}
}
variable "desktop_host_pool_variables" {
  type = map(object({
    host_pool_name                   = string
    host_pool_resource_group_name    = string
    location                         = string
    friendly_name                    = string
    description                      = string
    custom_rdp_properties            = string
    host_pool_type                   = string
    personal_desktop_assignment_type = string
    load_balancer_type               = string
    maximum_sessions_allowed         = string
    preferred_app_group_type         = string
    validate_environment             = bool
    start_vm_on_connect              = bool
    host_pool_tags                   = map(string)
  }))
  default = {}
}
