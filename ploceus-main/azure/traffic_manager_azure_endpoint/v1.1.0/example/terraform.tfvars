#RESOURCE GROUP 
resource_group_variables = {
  "resource_group_1" = {
    name     = "ploceusrg00001"
    location = "westus2"
    resource_group_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

#WORKSPACE
traffic_manager_profile_variables = {
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
    resource_group_name = "ploceusrg00001"
    tags = {
      "Created_By" = "Ploceus"
    }
    traffic_routing_method = "Subnet"
    traffic_view_enabled   = true
  }
}

traffic_manager_endpoint_variables = {
  "endpoint1" = {
    name                = "ploceustrafficendpoint000001"
    resource_group_name = "ploceusrg00001"
    weight              = "150"
    enabled             = true
    target_resource_id  = "/subscriptions/e3d2d88d-b54a-4fb7-b918-3cb24aad9ba9/resourceGroups/ploceusrg00001/providers/Microsoft.Network/publicIPAddresses/ploceustest000001"
    geo_mappings        = ["WORLD"]
    priority            = "100"
    custom_header = [{
      name  = "ploeuscustomheader"
      value = "ploceus.com"
    }]
    subnet = [{
      first = "10.0.0.0"
      last  = "10.0.0.255"
      scope = "24"
    }]
    profile_name = "ploceus1"
    profile_rg   = "ploceusrg00001"
  }
}
