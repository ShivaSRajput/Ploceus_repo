#variable definition for monitor_smart_detector_alert_rules
variable "smart_detector_alert_rules" {
  type = map(object({
    name                = string
    resource_group_name = string
    detector_type       = string
    scope_resources = map(object({
      scope_name                = string
      scope_resource_group_name = string
    }))
    action_group = object({
      action_groups_ids = map(object({
        action_group_name                = string
        action_group_resource_group_name = string
      }))
      email_subject   = string
      webhook_payload = string
    })
    severity            = string
    frequency           = string
    description         = string
    enabled             = bool
    throttling_duration = string
    tags                = map(string)
  }))
  default = {}
}


variable "resource_group_variables" {
  description = "Map of Resource groups"
  type = map(object({
    name                = string
    location            = string
    resource_group_tags = map(string)
  }))
  default = {}
}

variable "log_analytics_workspace_variables" {
  type = map(object({
    name                               = string
    location                           = string
    resource_group_name                = string
    sku                                = string
    retention_in_days                  = number
    daily_quota_gb                     = number
    internet_ingestion_enabled         = bool
    internet_query_enabled             = bool
    reservation_capacity_in_gb_per_day = number
    log_analytics_workspace_tags       = map(string)
  }))
}

#APPINSIGHTS VARIABLES
variable "application_insights_variables" {
  type = map(object({
    application_insights_name             = string
    resource_group_name                   = string
    application_insights_location         = string
    workspace_id                          = string
    application_type                      = string
    retention_in_days                     = number
    disable_ip_masking                    = bool
    daily_data_cap_in_gb                  = number
    daily_data_cap_notifications_disabled = string
    sampling_percentage                   = number
    local_authentication_disabled         = bool
    internet_ingestion_enabled            = bool
    internet_query_enabled                = bool
    force_customer_storage_for_profiler   = bool
    application_insights_tags             = map(string)
  }))
}


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
      name                                   = string
      account_name                           = string
      automation_runbook_subscription_id     = string
      automation_runbook_resource_group_name = string
      runbook_name                           = string
      webhook_resource_id                    = string
      is_global_runbook                      = bool
      service_uri                            = string
      use_common_alert_schema                = bool
    }))
    azure_app_push_receiver = map(object({
      name          = string
      email_address = string
    }))
    azure_function_receiver = map(object({
      name                               = string
      azure_function_resource_group_name = string
      function_app_name                  = string
      azure_function_subscription_id     = string
      function_name                      = string
      http_trigger_uri                   = string
      use_common_alert_schema            = bool
    }))
    email_receiver = map(object({
      name                    = string
      email_address           = string
      use_common_alert_schema = bool
    }))
    event_hub_receiver = map(object({
      name                          = string
      eventhub_name                 = string
      namespace                     = string
      event_hub_resource_group_name = string
      event_hub_subscription_id     = string
      tenant_id                     = string
      use_common_alert_schema       = bool
    }))
    itsm_receiver = map(object({
      name                     = string
      workspace_name           = string
      itsm_resource_group_name = string
      itsm_subscription_id     = string
      connection_id            = string
      ticket_configuration     = string
      region                   = string
    }))
    logic_app_receiver = map(object({
      name                          = string
      logic_app_subscription_id     = string
      logic_app_resource_group_name = string
      workflow_name                 = string
      callback_uri                  = string
      use_common_alert_schema       = string
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
