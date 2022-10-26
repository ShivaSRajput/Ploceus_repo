#RESOURCE GROUP 
resource_group_variables = {
  "resource_group_1" = {
    name     = "ploceusrg000002"
    location = "westus2"
    resource_group_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

#VIRTUAL_MACHINE_CUSTOM_EXTENSION
virtual_machine_extension_variables = {
  "vm_ext1" = {
    virtual_machine_name                = "ploceusvm000002"
    resource_group_name                 = "ploceusrg000002"
    name                                = "ploceusvmcustext000001"
    publisher                           = "Microsoft.Azure.Extensions"
    type                                = "CustomScript"
    type_handler_version                = "2.1"
    auto_upgrade_minor_version          = true
    automatic_upgrade_enabled           = false
    custom_extension_settings           = <<SETTINGS
                                      {

                                        "commandToExecute": "echo hello world"

                                      }
                                  SETTINGS
    custom_extension_protected_settings = null
    virtual_machine_extension_tags = {
      Created_by = "Ploceus"
      Department = "CIS"
    }
  }
}
