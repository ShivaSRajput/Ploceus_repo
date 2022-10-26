#VIRTUAL_MACHINE_CUSTOM_EXTENSION
virtual_machine_extension_variables = {
  "vm_ext1" = {
    virtual_machine_name       = "ploceusvm000001"
    resource_group_name        = "ploceusrg000001"
    name                       = "ploceusvmcustext000001"
    publisher                  = "Microsoft.Azure.Extensions"
    type                       = "CustomScript"
    type_handler_version       = "2.1"
    auto_upgrade_minor_version = true
    automatic_upgrade_enabled  = false
    command_to_execute         = "echo hello world"
    virtual_machine_extension_tags = {
      Created_by = "Ploceus"
      Department = "CIS"
    }
  }
}
