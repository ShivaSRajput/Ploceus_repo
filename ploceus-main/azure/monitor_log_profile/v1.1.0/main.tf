

locals {
  storage_accounts = { for k, v in data.azurerm_storage_account.storage_account : k => v.id }
  servicebus_rules = merge(
    { for k, v in data.azurerm_servicebus_namespace_authorization_rule.servicebus_rule : k => v.id },
    { for k, v in data.azurerm_eventhub_namespace_authorization_rule.eventhub_rule : k => v.id }
  )
}
data "azurerm_eventhub_namespace_authorization_rule" "eventhub_rule" {
  provider            = azurerm.servicebus_sub
  for_each            = { for k, v in var.monitor_log_profiles : k => v if v.servicebus_rule.servicebus_type == "eventhub" }
  name                = each.value.servicebus_rule.servicebus_name
  namespace_name      = each.value.servicebus_rule.servicebus_namespace
  resource_group_name = each.value.servicebus_rule.servicebus_resource_group_name
}
data "azurerm_servicebus_namespace_authorization_rule" "servicebus_rule" {
  provider            = azurerm.servicebus_sub
  for_each            = { for k, v in var.monitor_log_profiles : k => v if v.servicebus_rule.servicebus_type == "servicebus" }
  name                = each.value.servicebus_rule.servicebus_name
  namespace_name      = each.value.servicebus_rule.servicebus_namespace
  resource_group_name = each.value.servicebus_rule.servicebus_resource_group_name
}

data "azurerm_storage_account" "storage_account" {
  for_each            = { for k, v in var.monitor_log_profiles : k => v if v.storage_account.storage_account_name != null }
  provider            = azurerm.storage_sub
  name                = each.value.storage_account.storage_account_name
  resource_group_name = each.value.storage_account.storage_account_resource_group_name
}

resource "azurerm_monitor_log_profile" "monitor_log_profile" {
  for_each           = var.monitor_log_profiles
  provider           = azurerm.main_sub
  name               = each.value.monitor_log_name
  categories         = each.value.categories
  locations          = each.value.locations
  storage_account_id = lookup(local.storage_accounts, each.key, null)
  servicebus_rule_id = lookup(local.servicebus_rules, each.key, null)
  retention_policy {
    enabled = each.value.retention_policy.enabled
    days    = each.value.retention_policy.days
  }
}


