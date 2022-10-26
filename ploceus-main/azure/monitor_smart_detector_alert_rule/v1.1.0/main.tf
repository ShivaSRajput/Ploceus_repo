#Template for monitor_smart_detector_alert_rules
locals {
  resources_tomonitor = flatten([
    for k, v in var.smart_detector_alert_rules : [
      for i, j in v.scope_resources :
      merge({
        terraform_main_key = k, terraform_nested_key = i
      }, j)

  ]])
  action_groups = flatten([
    for k, v in var.smart_detector_alert_rules : [
      for i, j in v.action_group.action_groups_ids :
      merge({
        terraform_main_key = k, terraform_nested_key = i
      }, j)

  ]])
}

data "azurerm_resources" "scope_resources" {
  provider            = azurerm.scope_resouce_sub
  for_each            = { for i in local.resources_tomonitor : "${i.terraform_main_key},${i.terraform_nested_key}" => i }
  name                = each.value.scope_name
  resource_group_name = each.value.scope_resource_group_name
}

data "azurerm_monitor_action_group" "action_groups" {
  provider            = azurerm.action_group_sub
  for_each            = { for i in local.action_groups : "${i.terraform_main_key},${i.terraform_nested_key}" => i }
  resource_group_name = each.value.action_group_resource_group_name
  name                = each.value.action_group_name
}

resource "azurerm_monitor_smart_detector_alert_rule" "monitor_smart_detector_alert_rules" {
  provider = azurerm.smart_detector_alert_rule_sub
  for_each = var.smart_detector_alert_rules

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  detector_type       = each.value.detector_type
  scope_resource_ids  = [for k, v in each.value.scope_resources : data.azurerm_resources.scope_resources["${each.key},${k}"].resources[0].id]
  action_group {
    ids             = [for k, v in each.value.action_group.action_groups_ids : data.azurerm_monitor_action_group.action_groups["${each.key},${k}"].id]
    email_subject   = each.value.action_groups.email_subject
    webhook_payload = each.value.action_groups.webhook_payload
  }
  severity            = each.value.severity
  frequency           = each.value.frequency
  description         = each.value.description
  enabled             = each.value.enabled
  throttling_duration = each.value.throttling_duration

  tags = merge(each.value.tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
  lifecycle { ignore_changes = [tags["Created_Time"]] }
}
