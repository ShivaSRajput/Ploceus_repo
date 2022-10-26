# azure monitor aad diagnostics settings
locals {
  eventhub_auth_resources = { for k, v in var.diagnostic_settings : k => v.eventhub_authorization_rule if v.eventhub_authorization_rule.eventhub_authrule_name != null }
  eventhub_auth_ids       = { for k, v in data.azurerm_eventhub_namespace_authorization_rule.authorization_rule_id : k => v.id }

  law_resources = { for k, v in var.diagnostic_settings : k => v.log_analytics_workspace if v.log_analytics_workspace.log_analytics_name != null }
  law_ids       = { for k, v in data.azurerm_log_analytics_workspace.law_resources : k => v.id }

  storage_resources = { for k, v in var.diagnostic_settings : k => v.storage_account if v.storage_account.storage_account_name != null }
  storage_ids       = { for k, v in data.azurerm_storage_account.storage_resources : k => v.id }
}

data "azurerm_eventhub_namespace_authorization_rule" "authorization_rule_id" {
  provider            = azurerm.eventhub_sub
  for_each            = local.eventhub_auth_resources
  name                = each.value.eventhub_authrule_name
  namespace_name      = each.value.eventhub_namespace
  resource_group_name = each.value.eventhub_resource_group_name
}

data "azurerm_storage_account" "storage_resources" {
  provider            = azurerm.storage_resource_sub
  for_each            = local.storage_resources
  name                = each.value.storage_account_name
  resource_group_name = each.value.storage_account_resource_group_name
}

data "azurerm_log_analytics_workspace" "law_resources" {
  provider            = azurerm.log_analytics_workspace_sub
  for_each            = local.law_resources
  name                = each.value.log_analytics_name
  resource_group_name = each.value.log_analytics_resource_group_name
}

resource "azurerm_monitor_aad_diagnostic_setting" "diagnostic_settings" {
  for_each = var.diagnostic_settings
  name     = each.value.diagnostic_setting_name

  eventhub_name                  = each.value.eventhub_name
  eventhub_authorization_rule_id = lookup(local.eventhub_auth_ids, each.key, null)
  log_analytics_workspace_id     = lookup(local.law_ids, each.key, null)
  storage_account_id             = lookup(local.storage_ids, each.key, null)
  dynamic "log" {
    for_each = each.value.log
    content {
      category = log.value.category
      enabled  = log.value.enabled
      retention_policy {
        days    = log.value.retention_policy.days
        enabled = log.value.retention_policy.enabled
      }
    }
  }
}

