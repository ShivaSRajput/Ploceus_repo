variable "virtual_wan_variables" {
  type = map(object({
    name                              = string
    resource_group_name               = string
    disable_vpn_encryption            = bool
    allow_branch_to_branch_traffic    = bool
    location                          = string
    type                              = string
    office365_local_breakout_category = string
    tags                              = map(string)
  }))
}

#RESOURCE GROUP VARIABLES
variable "resource_group_variables" {
  description = "Map of Resource groups"
  type = map(object({
    name                = string
    location            = string
    resource_group_tags = map(string)
  }))
  default = {}
}