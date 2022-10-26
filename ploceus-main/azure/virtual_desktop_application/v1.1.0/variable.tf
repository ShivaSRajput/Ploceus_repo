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
