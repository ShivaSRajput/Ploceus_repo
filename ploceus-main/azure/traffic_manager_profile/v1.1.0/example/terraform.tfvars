
#WORKSPACE
traffic_manager_profiles = {
  "profile1" = {
    dns_config_ttl = 2
    max_return     = 2
    monitor_config = {
      protocol                     = "HTTPS"
      port                         = 443
      path                         = "/"
      interval_in_seconds          = 30
      timeout_in_seconds           = 10
      tolerated_number_of_failures = 3
      expected_status_code_ranges  = ["100-200", "300-400"]
      custom_header = {
        header1 = "Value1",
        header2 = "Value2"
      }
    }
    name                = "ploceus1"
    profile_status      = "Enabled"
    resource_group_name = "ploceusrg000001"
    tags = {
      "Created_By" = "Ploceus"
    }
    traffic_routing_method = "Subnet"
    traffic_view_enabled   = true
  }
}