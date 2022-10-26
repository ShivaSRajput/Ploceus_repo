#WEB_APPLICATION_FIREWALL_POLICY VARIABLE
variable "web_application_firewall_policy_variables" {
  type = map(object({
    web_application_firewall_policy_name                = string #Required
    web_application_firewall_policy_resource_group_name = string #Required
    location                                            = string #Optional
    web_application_firewall_policy_tags                = map(string)
    custom_rules = list(object({ #Optional
      name      = string
      priority  = string #Required Describes priority of the rule. Rules with a lower value will be evaluated before rules with a higher value
      rule_type = string #Required Describes the type of rule.
      action    = string #Required Type of action.
      match_conditions = list(object({
        operator           = string       #Required
        negation_condition = bool         #Optional
        match_values       = list(string) #Required
        transforms         = list(string) #Required
        match_variables = list(object({
          variable_name = string
          selector      = string
        }))
      }))
    }))
    policy_settings = list(object({
      enabled                     = bool   #Optional Describes if the policy is in enabled state or disabled state. Defaults to true.
      mode                        = string #Optional Describes if it is in detection mode or prevention mode at the policy level. Valid values are Detection and Prevention. Defaults to Prevention.
      request_body_check          = bool   #Optional Is Request Body Inspection enabled? Defaults to true.
      file_upload_limit_in_mb     = number #Optional The File Upload Limit in MB. Accepted values are in the range 1 to 4000. Defaults to 100.
      max_request_body_size_in_kb = number #Optional The Maximum Request Body Size in KB. Accepted values are in the range 8 to 2000. Defaults to 128.
    }))
    managed_rules = list(object({
      exclusion = list(object({
        match_variable          = string #Required The name of the Match Variable. Possible values: RequestArgNames, RequestCookieNames, RequestHeaderNames.
        selector                = string #Optional
        selector_match_operator = string #Required Describes operator to be matched. Possible values: Contains, EndsWith, Equals, EqualsAny, StartsWith.
      }))
      managed_rule_set = list(object({
        type    = string                    #Optional The rule set type. Possible values: Microsoft_BotManagerRuleSet and OWASP.
        version = string                    #Required The rule set version. Possible values: 0.1, 1.0, 2.2.9, 3.0, 3.1 and 3.2.
        rule_group_override = list(object({ #Optional
          rule_group_name = string          #Required
          disabled_rules  = list(string)    #Optional
        }))
      }))
    }))
  }))
}