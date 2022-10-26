#virtual_desktop_host_pool_registration_info
desktop_host_pool_registration_info_variables = {
  "key" = {
    expiration_time               = "2022-10-10T23:40:52Z"
    host_pool_name                = "ploceushp000001"
    host_pool_resource_group_name = "ploceusrg000001"
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

 