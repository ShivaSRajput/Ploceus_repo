#windows VDI App Groups Variable
variable "desktop_application_variables" {
  type = map(object({
    app_group = object({
      app_group_name                = string
      app_group_resource_group_name = string
    })
    name                         = string
    friendly_name                = string
    description                  = string
    path                         = string
    command_line_argument_policy = string
    command_line_arguments       = string
    show_in_portal               = bool
    icon_path                    = string
    icon_index                   = number
  }))
  default = {}
}


#windows VDI App Groups Variable
variable "desktop_application_group_variables" {
  type = map(object({
    app_group_name                = string
    app_group_resource_group_name = string
    type                          = string
    host_pool = object({
      host_pool_name                = string
      host_pool_resource_group_name = string
    })
    friendly_name                = string
    description                  = string
    appgroup_tags                = map(string)
    default_desktop_display_name = string
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
