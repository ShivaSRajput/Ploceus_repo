
#WORKSPACE
desktop_workspace_application_group_association_variables = {
  "workspaceappgroup" = {
    app_group = {
      app_group_name                = "ploceusappGroup"
      app_group_resource_group_name = "ploceusrg000001"
    }
    workspace = {
      workspace_name                = "ploceusvdiworkspace000001"
      workspace_resource_group_name = "ploceusrg000001"
    }
  }
}
desktop_application_group_variables = {
  "key" = {
    appgroup_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
    description   = "Description of App Group"
    friendly_name = "Ploceus App Group"
    host_pool = {
      host_pool_name                = "ploceushp000001"
      host_pool_resource_group_name = "ploceusrg000001"
    }
    app_group_name                = "ploceusappGroup"
    app_group_resource_group_name = "ploceusrg000001"
    type                          = "Desktop"
    default_desktop_display_name  = "Ploceus"
  }
}


desktop_host_pool_variables = {
  "host_pool1" = {
    host_pool_name                   = "ploceushp000001"
    location                         = "westus2"
    host_pool_resource_group_name    = "ploceusrg000001"
    friendly_name                    = "ploceushp000001"
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

desktop_workspaces_variables = {
  "workspace" = {
    workspace_name                = "ploceusvdiworkspace000001"
    location                      = "westus2"
    workspace_resource_group_name = "ploceusrg000001"
    friendly_name                 = "ploceusvdi"
    description                   = "Workspace for Ploceus User"
    workspace_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

resource_group_variables = {
  "resource_group_1" = {
    name     = "ploceusrg000001"
    location = "westus2"
    resource_group_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}
