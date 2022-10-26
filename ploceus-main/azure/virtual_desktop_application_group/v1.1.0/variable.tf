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
