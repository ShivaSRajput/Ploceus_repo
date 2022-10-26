
variable "resource_group_variables" {
  description = "Map of Resource groups"
  type = map(object({
    name                = string
    location            = string
    resource_group_tags = map(string)
  }))
  default = {}
}
variable "monitor_private_link_scope" {
  type = map(object({
    name                                 = string
    resource_group_name                  = string
    tags = map(string)
  }))
  description = "variable for private link scope details"
  default     = {}
}