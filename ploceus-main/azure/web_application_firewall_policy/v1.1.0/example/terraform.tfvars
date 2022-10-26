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


web_application_firewall_policy_variables = {
  "web_application_firewall_policy_1" = {
    web_application_firewall_policy_name                = "ploceuswafp000001"
    web_application_firewall_policy_resource_group_name = "ploceusrg000001"
    location                                            = "westus2"
    web_application_firewall_policy_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
    custom_rules = [{
      name      = "ploceuswafp000001a"
      priority  = 1
      rule_type = "MatchRule"
      action    = "Block"
      match_conditions = [{
        operator           = "IPMatch"
        negation_condition = false
        transforms         = null
        match_values       = ["192.168.1.0/24", "10.0.0.0/24"]
        match_variables = [{
          variable_name = "RemoteAddr"
          selector      = null
        }]
      }]
      },

      {
        name      = "ploceuswafp000001b"
        priority  = 2
        rule_type = "MatchRule"
        action    = "Block"
        match_conditions = [{
          operator           = "Contains"
          negation_condition = false
          transforms         = null
          match_values       = ["Windows"]
          match_variables = [{
            variable_name = "RequestHeaders"
            selector      = "UserAgent"
          }]
        }]
      }
    ]
    policy_settings = [{
      enabled                     = true
      mode                        = "Prevention"
      request_body_check          = true
      file_upload_limit_in_mb     = 100
      max_request_body_size_in_kb = 128
    }]
    managed_rules = [{
      exclusion = [{
        match_variable          = "RequestCookieNames"
        selector                = "too-tasty"
        selector_match_operator = "EndsWith"
      }]
      managed_rule_set = [{
        type    = "OWASP"
        version = "3.1"
        rule_group_override = [{
          rule_group_name = "REQUEST-920-PROTOCOL-ENFORCEMENT"
          disabled_rules = [
            "920300",
            "920440"
          ]
        }]
      }]
    }]
  }
}