#WEB_APPLICATION_FIREWALL_POLICY
resource "azurerm_web_application_firewall_policy" "web_application_firewall_policy" {
  for_each            = var.web_application_firewall_policy_variables
  name                = each.value.web_application_firewall_policy_name
  resource_group_name = each.value.web_application_firewall_policy_resource_group_name
  location            = each.value.location

  dynamic "custom_rules" {
    for_each = each.value.custom_rules != null ? toset(each.value.custom_rules) : []
    content {
      name      = custom_rules.value.name
      priority  = custom_rules.value.priority
      rule_type = custom_rules.value.rule_type

      dynamic "match_conditions" {
        for_each = custom_rules.value.match_conditions != null ? toset(custom_rules.value.match_conditions) : []
        content {
          dynamic "match_variables" {
            for_each = match_conditions.value.match_variables != null ? toset(match_conditions.value.match_variables) : []
            content {
              variable_name = match_variables.value.variable_name
              selector      = match_variables.value.selector
            }
          }
          operator           = match_conditions.value.operator
          negation_condition = match_conditions.value.negation_condition
          match_values       = match_conditions.value.match_values
          transforms         = match_conditions.value.transforms
        }
      }
      action = custom_rules.value.action
    }
  }

  dynamic "policy_settings" {
    for_each = each.value.policy_settings != null ? toset(each.value.policy_settings) : []
    content {
      enabled                     = policy_settings.value.enabled
      mode                        = policy_settings.value.mode
      request_body_check          = policy_settings.value.request_body_check
      file_upload_limit_in_mb     = policy_settings.value.file_upload_limit_in_mb
      max_request_body_size_in_kb = policy_settings.value.max_request_body_size_in_kb
    }
  }

  dynamic "managed_rules" {
    for_each = each.value.managed_rules != null ? toset(each.value.managed_rules) : []
    content {
      dynamic "exclusion" {
        for_each = managed_rules.value.exclusion != null ? toset(managed_rules.value.exclusion) : []
        content {
          match_variable          = exclusion.value.match_variable
          selector                = exclusion.value.selector
          selector_match_operator = exclusion.value.selector_match_operator
        }
      }
      dynamic "managed_rule_set" {
        for_each = managed_rules.value.managed_rule_set != null ? toset(managed_rules.value.managed_rule_set) : []
        content {
          type    = managed_rule_set.value.type
          version = managed_rule_set.value.version
          dynamic "rule_group_override" {
            for_each = managed_rule_set.value.rule_group_override != null ? toset(managed_rule_set.value.rule_group_override) : []
            content {
              rule_group_name = rule_group_override.value.rule_group_name
              disabled_rules  = rule_group_override.value.disabled_rules
            }
          }
        }
      }
    }
  }
  tags = merge(each.value.web_application_firewall_policy_tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
  lifecycle { ignore_changes = [tags["Created_Time"]] }
} 