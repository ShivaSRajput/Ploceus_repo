#windows VDI App Groups Variable
variable "desktop_workspace_application_group_association_variables" {
  type = map(object({
    app_group = object({
      app_group_name                = string
      app_group_resource_group_name = string
    })
    workspace = object({
      workspace_name                = string
      workspace_resource_group_name = string
    })
  }))
}
