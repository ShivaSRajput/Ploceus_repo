resource "azurerm_monitor_action_group" "monitor_action_group" {
  for_each            = var.monitor_action_group_variables
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  short_name          = each.value.short_name
  enabled             = each.value.enabled
  
  dynamic "arm_role_receiver" {
    for_each = each.value.arm_role_receiver
    content {
      name                    = arm_role_receiver.value.name
      role_id                 = arm_role_receiver.value.role_id
      use_common_alert_schema = arm_role_receiver.value.use_common_alert_schema
    }
  }
  
  dynamic "email_receiver" {
    for_each = each.value.email_receiver
    content {
      name                    = email_receiver.value.name
      email_address           = email_receiver.value.email_address
      use_common_alert_schema = email_receiver.value.use_common_alert_schema
    }
  }
  
  dynamic "sms_receiver" {
    for_each = each.value.sms_receiver
    content {
      name         = sms_receiver.value.name
      country_code = sms_receiver.value.country_code
      phone_number = sms_receiver.value.phone_number
    }
  }
  
  dynamic "azure_app_push_receiver" {
    for_each = each.value.azure_app_push_receiver
    content {
      name          = azure_app_push_receiver.value.name
      email_address = azure_app_push_receiver.value.email_address
    }
  }
  
  dynamic "voice_receiver" {
    for_each = each.value.voice_receiver
    content {
      name         = voice_receiver.value.name
      country_code = voice_receiver.value.country_code
      phone_number = voice_receiver.value.phone_number
    }
  }
  
  dynamic "webhook_receiver" {
    for_each = each.value.webhook_receiver
    content {
      name                    = webhook_receiver.value.name
      service_uri             = webhook_receiver.value.service_uri
      use_common_alert_schema = webhook_receiver.value.use_common_alert_schema
      dynamic "aad_auth" {
        for_each = webhook_receiver.value.aad_auth == null ? [] : [1]
        content {
          object_id      = lookup(webhook_receiver.value.aad_auth,"object_id",null)
          identifier_uri = webhook_receiver.value.aad_auth.identifier_uri
          tenant_id      = webhook_receiver.value.aad_auth.tenant_id
        }
      }
    }
  }
  
  dynamic "itsm_receiver" {
    for_each = each.value.itsm_receiver
    content {
      name                 = itsm_receiver.value.name
      workspace_id         = "/subscriptions/${itsm_receiver.value.itsm_subscription_id}/resourceGroups/${itsm_receiver.value.itsm_resource_group_name}/providers/Microsoft.OperationalInsights/workspaces/${itsm_receiver.value.workspace_name}"
      connection_id        = itsm_receiver.value.connection_id
      ticket_configuration = itsm_receiver.value.ticket_configuration
      region               = itsm_receiver.value.region
    }
  }
  
  dynamic "automation_runbook_receiver" {
    for_each = each.value.automation_runbook_receiver
    content {
      name                    = automation_runbook_receiver.value.name
      automation_account_id   = "/subscriptions/${automation_runbook_receiver.value.automation_runbook_subscription_id}/resourceGroups/${automation_runbook_receiver.value.automation_runbook_resource_group_name}/providers/Microsoft.Automation/automationAccounts/${automation_runbook_receiver.value.account_name}"
      runbook_name            = automation_runbook_receiver.value.runbook_name
      webhook_resource_id     = automation_runbook_receiver.value.webhook_resource_id
      is_global_runbook       = automation_runbook_receiver.value.is_global_runbook
      service_uri             = automation_runbook_receiver.value.service_uri
      use_common_alert_schema = automation_runbook_receiver.value.use_common_alert_schema
    }
  }
  
  dynamic "logic_app_receiver" {
    for_each = each.value.logic_app_receiver
    content {
      name                    = logic_app_receiver.value.name
      resource_id             = "/subscriptions/${logic_app_receiver.value.logic_app_subscription_id}/resourceGroups/${logic_app_receiver.value.logic_app_resource_group_name}/providers/Microsoft.Logic/workflows/${logic_app_receiver.value.workflow_name}"
      callback_url            = logic_app_receiver.value.callback_url
      use_common_alert_schema = logic_app_receiver.value.use_common_alert_schema
    }
  }
  
  dynamic "azure_function_receiver" {
    for_each = each.value.azure_function_receiver
    content {
      name                     = azure_function_receiver.value.name
      function_app_resource_id = "/subscriptions/${azure_function_receiver.value.azure_function_subscription_id}/resourceGroups/${azure_function_receiver.value.azure_function_resource_group_name}/providers/Microsoft.Web/sites/${azure_function_receiver.value.function_app_name}"
      function_name            = azure_function_receiver.value.function_name
      http_trigger_url         = azure_function_receiver.value.http_trigger_url
      use_common_alert_schema  = azure_function_receiver.value.use_common_alert_schema
    }
  }
  
  dynamic "event_hub_receiver" {
    for_each = each.value.event_hub_receiver
    content {
      name                    = event_hub_receiver.value.name
      event_hub_id            = "/subscriptions/${event_hub_receiver.value.event_hub_subscription_id}/resourceGroups/${event_hub_receiver.value.event_hub_resource_group_name}/providers/Microsoft.EventHub/namespaces/${event_hub_receiver.value.namespace}/eventhubs/${event_hub_receiver.value.eventhub_name}"
      tenant_id               = event_hub_receiver.value.tenant_id
      use_common_alert_schema = event_hub_receiver.value.use_common_alert_schema
    }
  }
  tags = merge(each.value.tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
  lifecycle { ignore_changes = [tags["Created_Time"]] }
}