#windows VDI Workspace Variable
variable "desktop_workspaces_variables" {
  type = map(object({
    workspace_name                = string
    workspace_resource_group_name = string
    location                      = string
    friendly_name                 = string
    description                   = string
    workspace_tags                = map(string)
  }))
}

