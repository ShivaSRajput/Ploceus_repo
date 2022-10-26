
#WORKSPACE
desktop_scaling_plan_variables = {
  "plan_1" = {
    description                      = "Scaling Plan"
    friendly_name                    = "ploceus friendly name"
    scaling_plan_resource_group_name = "ploceusrg000001"
    host_pool = {
      host_pool_name                = "ploceushp000003"
      host_pool_resource_group_name = "ploceusrg000001"
      scaling_plan_enabled          = true
    }
    scaling_plan_name = "ploceus_scaling_plan"
    schedule = {
      days_of_week = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
      name         = "ploceus_schedule"
      off_peak = {
        load_balancing_algorithm = "DepthFirst"
        start_time               = "22:00"
      }
      peak = {
        load_balancing_algorithm = "BreadthFirst"
        start_time               = "09:00"
      }
      ramp_down = {
        capacity_threshold_percent = 5
        force_logoff_users         = false
        load_balancing_algorithm   = "DepthFirst"
        minimum_hosts_percent      = 10
        notification_message       = "Please log off in the next 45 minutes..."
        start_time                 = "19:00"
        stop_hosts_when            = "ZeroSessions"
        wait_time_minutes          = 45
      }
      ramp_up = {
        capacity_threshold_percent = 10
        load_balancing_algorithm   = "BreadthFirst"
        minimum_hosts_percent      = 20
        start_time                 = "05:00"
      }
    }
    tags = {
      creator      = "Ploceus"
      Department   = "CIS"
      plan_enabled = "True"
    }
    time_zone = "GMT Standard Time"
  }
}


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
 