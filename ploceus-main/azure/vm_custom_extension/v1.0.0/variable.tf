variable "virtual_machine_extension_variables" {
  type = map(object({
    virtual_machine_name           = string
    resource_group_name            = string
    name                           = string
    publisher                      = string
    type                           = string
    type_handler_version           = number
    auto_upgrade_minor_version     = bool
    automatic_upgrade_enabled      = bool
    command_to_execute             = string
    virtual_machine_extension_tags = map(string)
  }))
  description = "Map containing vm custom extension variables"
  default     = {}
}
