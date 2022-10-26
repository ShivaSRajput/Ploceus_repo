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
    traffic_routing_method = "Performance"
    traffic_view_enabled   = true
  },
  "profile2" = {
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
    name                = "ploceus2"
    profile_status      = "Enabled"
    resource_group_name = "ploceusrg00001"
    tags = {
      "Created_By" = "Ploceus"
    }
    traffic_routing_method = "Priority"
    traffic_view_enabled   = true
  }
}

traffic_manager_nested_endpoint_variables = {
  "nested_endpoint1" = {
    name                                  = "ploceusnestedendpoint000001"
    weight                                = "150"
    enabled                               = true
    target_resource_id                    = "ploceus2"
    geo_mappings                          = ["WORLD"]
    priority                              = "100"
    minimum_child_endpoints               = "3"
    endpoint_location                     = "westus2"
    minimum_required_child_endpoints_ipv4 = "1"
    minimum_required_child_endpoints_ipv6 = "2"
    custom_header = [{
      name  = "ploeuscustomheader"
      value = "ploceus.com"
    }]
    subnet = [{
      first = "10.0.0.0"
      last  = "10.0.0.255"
      scope = "24"
    }]
    profile_name        = "ploceus1"
    profile_rg          = "ploceusrg00001"
    nested_profile_name = "ploceus2"
    nested_profile_rg   = "ploceusrg00001"
  }
}


