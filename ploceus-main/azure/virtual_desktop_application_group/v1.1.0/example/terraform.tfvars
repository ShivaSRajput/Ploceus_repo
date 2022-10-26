
#WORKSPACE
desktop_application_group_variables = {
  "key" = {
    appgroup_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
    description   = "Description of App Group"
    friendly_name = "Ploceus App Group"
    host_pool = {
      host_pool_name                = "ploceushostpool000001"
      host_pool_resource_group_name = "ploceusrg000001"
    }
    app_group_name                = "ploceusappgroup000001"
    app_group_resource_group_name = "ploceusrg000001"
    type                          = "Desktop"
    default_desktop_display_name  = "Ploceus"
  }
}

resource_group_variables = {
  "hostPoolResourceGroup" = {
    location = "westus2"
    name     = "ploceusrg000001"
    resource_group_tags = {
      "Created_By" = "Ploceus"
      Department   = "CIS"
    }
  }
}

desktop_host_pool_variables = {
  "host_pool1" = {
    host_pool_name                   = "ploceushostpool000001"
    location                         = "westus2"
    host_pool_resource_group_name    = "ploceusrg000001"
    friendly_name                    = "ploceushostpool000001"
    description                      = "hostPoolDescription"
    custom_rdp_properties            = null
    host_pool_type                   = "Personal"
    personal_desktop_assignment_type = "Automatic"
    load_balancer_type               = "Persistent"
    preferred_app_group_type         = "Desktop" # can be Desktop, RailApplications
    # if host_pool_type is personal pass maximum_sessions_allowed = null
    maximum_sessions_allowed = null
    validate_environment     = true
    start_vm_on_connect      = true
    host_pool_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}
