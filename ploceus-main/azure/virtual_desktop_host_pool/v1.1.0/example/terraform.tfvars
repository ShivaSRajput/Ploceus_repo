#RESOURCE GROUP 
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


#HOSTPOOL
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
  },
  "host_pool2" = {
    host_pool_name                = "ploceushp000002"
    location                      = "westus2"
    host_pool_resource_group_name = "ploceusrg000001"
    friendly_name                 = "ploceushp000002"
    description                   = "hostPoolDescription"
    custom_rdp_properties         = null
    host_pool_type                = "Pooled"
    # if host_pool_type is pooled make personal_desktop_assignment_type = null
    personal_desktop_assignment_type = null
    load_balancer_type               = "BreadthFirst"
    preferred_app_group_type         = "Desktop" # can be Desktop, RailApplications
    # if host_pool_type is personal make maximum_sessions_allowed = 0
    maximum_sessions_allowed = 3
    validate_environment     = true
    start_vm_on_connect      = true
    host_pool_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  },
  "host_pool3" = {
    host_pool_name                = "ploceushp000003"
    location                      = "westus2"
    host_pool_resource_group_name = "ploceusrg000001"
    friendly_name                 = "ploceushp000003"
    description                   = "hostPoolDescription"
    custom_rdp_properties         = null
    host_pool_type                = "Pooled"
    # if host_pool_type is pooled make personal_desktop_assignment_type = null
    personal_desktop_assignment_type = null
    load_balancer_type               = "BreadthFirst"
    preferred_app_group_type         = "Desktop" # can be Desktop, RailApplications
    # if host_pool_type is personal make maximum_sessions_allowed = 0
    maximum_sessions_allowed = 3
    validate_environment     = true
    start_vm_on_connect      = true
    host_pool_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }

}