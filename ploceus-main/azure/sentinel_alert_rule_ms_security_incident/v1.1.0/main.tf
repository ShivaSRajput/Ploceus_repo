data "azurerm_log_analytics_workspace" "log_analytics_workspace" {
  for_each            = var.sentinel_alert_rule_ms_security_incident_variables
  name                = each.value.log_analytics_workspace_name
  resource_group_name = each.value.log_analytics_workspace_resource_group_name
}

resource "azurerm_sentinel_alert_rule_ms_security_incident" "sentinel_alert_rule_ms_security_incident" {
  for_each                    = var.sentinel_alert_rule_ms_security_incident_variables
  name                        = each.value.sentinel_alert_rule_ms_security_incident_name
  log_analytics_workspace_id  = data.azurerm_log_analytics_workspace.log_analytics_workspace[each.key].id
  display_name                = each.value.display_name
  product_filter              = each.value.product_filter
  severity_filter             = each.value.severity_filter
  alert_rule_template_guid    = each.value.alert_rule_template_guid
  description                 = each.value.description
  enabled                     = each.value.enabled
  display_name_filter         = each.value.display_name_filter
  display_name_exclude_filter = each.value.display_name_exclude_filter
}
