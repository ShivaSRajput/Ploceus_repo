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