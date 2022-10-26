locals {
  actions_data = flatten([for k, v in var.security_centre_automation_variables : [for i in v.actions :
    merge(i, { key = "${i.actions_resource_name}_${i.actions_type}" })
  ]])
  log_analytics_type = { for k, v in local.actions_data : v.key => v if v.actions_type == "LogAnalytics" }
  logic_app_type     = { for k, v in local.actions_data : v.key => v if v.actions_type == "LogicApp" }
  event_hub_type     = { for k, v in local.actions_data : v.key => v if v.actions_type == "EventHub" }
}

data "azurerm_log_analytics_workspace" "log_analytics_workspace" {
  for_each            = local.log_analytics_type
  name                = each.value.actions_resource_name
  resource_group_name = each.value.actions_resource_group_name
}

data "azurerm_eventhub" "example" {
  for_each            = local.event_hub_type
  name                = each.value.actions_resource_name
  resource_group_name = each.value.actions_resource_group_name
  namespace_name      = each.value.actions_eventhub_namespace
}

data "azurerm_logic_app_standard" "example" {
  for_each            = local.logic_app_type
  name                = each.value.actions_resource_name
  resource_group_name = each.value.actions_resource_group_name
}

resource "azurerm_security_center_automation" "security_centre_automation" {
  for_each            = var.security_centre_automation_variables
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  dynamic "action" {
    for_each = local.actions_data
    content {
      type              = action.value.actions_type
      resource_id       = ((action.value.actions_type == "EventHub") ? data.azurerm_eventhub.example["${action.value.actions_resource_name}_${action.value.actions_type}"].id : (action.value.actions_type == "LogAnalytics" ? data.azurerm_log_analytics_workspace.log_analytics_workspace["${action.value.actions_resource_name}_${action.value.actions_type}"].id : data.azurerm_logic_app_standard.example["${action.value.actions_resource_name}_${action.value.actions_type}"].id))
      connection_string = action.value.actions_connection_string
      trigger_url       = action.value.actions_trigger_url
    }
  }

  source {
    event_source = each.value.event_source
    rule_set {
      rule {
        property_path  = each.value.property_path
        operator       = each.value.operator
        expected_value = each.value.expected_value
        property_type  = each.value.property_type
      }
    }
  }

  scopes = each.value.scopes
}