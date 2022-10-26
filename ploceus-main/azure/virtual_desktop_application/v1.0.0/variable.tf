#windows VDI App Groups Variable
variable "applications" {
  type = map(object({
    app_group                    = string
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
}
