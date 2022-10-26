variable "monitor_action_group_variables" {
  type = map(object({
    name                = string
    resource_group_name = string
    short_name          = string
    enabled             = bool
    arm_role_receiver = map(object({
      name                    = string
      role_id                 = string
      use_common_alert_schema = bool
    }))
    automation_runbook_receiver = map(object({
      name                    = string
      account_name            = string
      automation_runbook_subscription_id         = string
      automation_runbook_resource_group_name     = string
      runbook_name            = string
      webhook_resource_id     = string
      is_global_runbook       = bool
      service_uri             = string
      use_common_alert_schema = bool
    }))
    azure_app_push_receiver = map(object({
      name          = string
      email_address = string
    }))
    azure_function_receiver = map(object({
      name                    = string
      azure_function_resource_group_name     = string
      function_app_name       = string
      azure_function_subscription_id         = string
      function_name           = string
      http_trigger_uri        = string
      use_common_alert_schema = bool
    }))
    email_receiver = map(object({
      name                    = string
      email_address           = string
      use_common_alert_schema = bool
    }))
    event_hub_receiver = map(object({
      name                    = string
      eventhub_name           = string
      namespace               = string
      event_hub_resource_group_name     = string
      event_hub_subscription_id         = string
      tenant_id               = string
      use_common_alert_schema = bool
    }))
    itsm_receiver = map(object({
      name                 = string
      workspace_name       = string
      itsm_resource_group_name  = string
      itsm_subscription_id      = string
      connection_id        = string
      ticket_configuration = string
      region               = string
    }))
    logic_app_receiver = map(object({
      name                    = string
      logic_app_subscription_id         = string
      logic_app_resource_group_name     = string
      workflow_name           = string
      callback_uri            = string
      use_common_alert_schema = string
    }))
    sms_receiver = map(object({
      name         = string
      country_code = string
      phone_number = string
    }))
    voice_receiver = map(object({
      name         = string
      country_code = string
      phone_number = string
    }))
    webhook_receiver = map(object({
      name                    = string
      service_uri             = string
      use_common_alert_schema = bool
      aad_auth = object({
        object_id      = string
        identifier_uri = string
        tenant_id      = string
      })
    }))
    tags = map(string)

  }))
  default = {}
}