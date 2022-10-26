
#WORKSPACE
scaling_plans = {
  "plan_1" = {
    description   = "Scaling Plan"
    friendly_name = "ploceus friendly name"
    host_pool = {
      name                 = "ploceus_pool"
      scaling_plan_enabled = true
    }
    name = "ploceus_scaling_plan"
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
      creator      = "Aayush"
      plan_enabled = "True"
    }
    time_zone = "GMT Standard Time"
  }
}