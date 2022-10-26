#variable for monitor_smart_detector_alert_rules
smart_detector_alert_rules = {
  "alert_rule" = {
    action_group = {
      action_groups_ids = {
        "action1" = {
          action_group_name                = "ploceusag000001"
          action_group_resource_group_name = "ploceusrg000001"
        }
        "action2" = {
          action_group_name                = "ploceusag000002"
          action_group_resource_group_name = "ploceusrg000001"
        }
      }
      email_subject   = "action triggered"
      webhook_payload = null
    }
    description         = "smart detector"
    detector_type       = "FailureAnomaliesDetector"
    enabled             = false
    frequency           = "PT1M"
    name                = "ploceussdar000001"
    resource_group_name = "ploceusrg000001"
    scope_resources = {
      "app_insight" = {
        scope_name                = "ploceusai000001"
        scope_resource_group_name = "ploceusrg000001"
      }
    }
    
    severity = "Sev0"
    tags = {
      "Created_By" = "Ploceus"
      Department   = "CIS"
    }
    throttling_duration = "PT5M"
  }
}

#RESOURCE GROUP 
resource_group_variables = {
  "resource_group_1" = {
    name     = "ploceusrg000001"
    location = "westus2"
    resource_group_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

#LOG ANALYTICS WORKSPACE
log_analytics_workspace_variables = {
  "log_analytics_workspace_1" = {
    name                               = "ploceuslog000001" #Required
    location                           = "westus2"          #Required
    resource_group_name                = "ploceusrg000001"  #Required
    sku                                = "PerGB2018"        #Optional
    retention_in_days                  = null               #Optional
    daily_quota_gb                     = null               #Optional
    internet_ingestion_enabled         = null               #Optional
    internet_query_enabled             = null               #Optional
    reservation_capacity_in_gb_per_day = null               #Optional
    log_analytics_workspace_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

#APPLICATION INSIGHTS
application_insights_variables = {
  application_insights_1 = {
    application_insights_name             = "ploceusai000001"
    resource_group_name                   = "ploceusrg000001"
    application_insights_location         = "westus2"
    workspace_id                          = "ploceuslog000001" #log_analytics_workspace_name
    application_type                      = "web"
    retention_in_days                     = 90
    disable_ip_masking                    = false
    daily_data_cap_in_gb                  = 10
    daily_data_cap_notifications_disabled = null
    sampling_percentage                   = 50
    local_authentication_disabled         = false
    internet_ingestion_enabled            = true
    internet_query_enabled                = true
    force_customer_storage_for_profiler   = false
    application_insights_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}


monitor_action_group_variables = {
  "action1" = {
    arm_role_receiver = {
      "monitoring_contributor" = {
        name                    = "Monitoring Contributor"
        role_id                 = "749f88d5-cbae-40b8-bcfc-e573ddc772fa"
        use_common_alert_schema = true
      }
      "monitoring_reader" = {
        name                    = "Monitoring Reader"
        role_id                 = "43d0d8ad-25c7-4714-9337-8ba259a9fe05"
        use_common_alert_schema = true
      }
    }
    automation_runbook_receiver = {}
    azure_app_push_receiver = {
      "ploceus" = {
        email_address = "xxxxxxxx_apppush@neudesic.com"
        name          = "xxxxxxxx_apppush"
      }
      "ploceus2" = {
        email_address = "xxxxxxxx_apppush2@neudesic.com"
        name          = "xxxxxxxx_apppush2"
      }
    }
    azure_function_receiver = {}
    email_receiver = {
      "ploceus" = {
        email_address           = "xxxxxxxx_email@neudesic.com"
        name                    = "xxxxxxxx_email"
        use_common_alert_schema = true
      }
      "ploceus2" = {
        email_address           = "xxxxxxxx_email2@neudesic.com"
        name                    = "xxxxxxxx_email2"
        use_common_alert_schema = true
      }
    }
    enabled             = false
    event_hub_receiver  = {}
    itsm_receiver       = {}
    logic_app_receiver  = {}
    name                = "ploceusag000001"
    resource_group_name = "ploceusrg000001"
    short_name          = "pag1"
    sms_receiver = {
      "key" = {
        name         = "remotesupport"
        country_code = "1"
        phone_number = "2027953213"
      }
      "key2" = {
        name         = "remotesupport2"
        country_code = "1"
        phone_number = "2027953214"
      }
    }
    tags = {
      "Created_By" = "Ploceus"
      Department   = "CIS"
    }
    voice_receiver = {
      "key" = {
        name         = "remotesupport_voice"
        country_code = "1"
        phone_number = "2027953213"
      }
      "key2" = {
        name         = "remotesupport_voice2"
        country_code = "1"
        phone_number = "2027953214"
      }
    }
    webhook_receiver = {}
  }
  "action2" = {
    arm_role_receiver = {
      "monitoring_contributor" = {
        name                    = "Monitoring Contributor"
        role_id                 = "749f88d5-cbae-40b8-bcfc-e573ddc772fa"
        use_common_alert_schema = true
      }
      "monitoring_reader" = {
        name                    = "Monitoring Reader"
        role_id                 = "43d0d8ad-25c7-4714-9337-8ba259a9fe05"
        use_common_alert_schema = true
      }
    }
    automation_runbook_receiver = {}
    azure_app_push_receiver = {
      "ploceus" = {
        email_address = "xxxxxxxx_apppush@neudesic.com"
        name          = "xxxxxxxx_apppush"
      }
      "ploceus2" = {
        email_address = "xxxxxxxx_apppush2@neudesic.com"
        name          = "xxxxxxxx_apppush2"
      }
    }
    azure_function_receiver = {}
    email_receiver = {
      "ploceus" = {
        email_address           = "xxxxxxxx_email@neudesic.com"
        name                    = "xxxxxxxx_email"
        use_common_alert_schema = true
      }
      "ploceus2" = {
        email_address           = "xxxxxxxx_email2@neudesic.com"
        name                    = "xxxxxxxx_email2"
        use_common_alert_schema = true
      }
    }
    enabled             = false
    event_hub_receiver  = {}
    itsm_receiver       = {}
    logic_app_receiver  = {}
    name                = "ploceusag000002"
    resource_group_name = "ploceusrg000001"
    short_name          = "pag1"
    sms_receiver = {
      "key" = {
        name         = "remotesupport"
        country_code = "1"
        phone_number = "2027953213"
      }
      "key2" = {
        name         = "remotesupport2"
        country_code = "1"
        phone_number = "2027953214"
      }
    }
    tags = {
      "Created_By" = "Ploceus"
      Department   = "CIS"
    }
    voice_receiver = {
      "key" = {
        name         = "remotesupport_voice"
        country_code = "1"
        phone_number = "2027953213"
      }
      "key2" = {
        name         = "remotesupport_voice2"
        country_code = "1"
        phone_number = "2027953214"
      }
    }
    webhook_receiver = {}
  }
}


scope_resouce_sub_subscription_id             = "7877d8aa-c51f-4741-b864-e77ef88cd435"
scope_resouce_sub_tenant_id                   = "687f51c3-0c5d-4905-84f8-97c683a5b9d1"
action_group_sub_subscription_id              = "7877d8aa-c51f-4741-b864-e77ef88cd435"
action_group_sub_tenant_id                    = "687f51c3-0c5d-4905-84f8-97c683a5b9d1"
smart_detector_alert_rule_sub_subscription_id = "7877d8aa-c51f-4741-b864-e77ef88cd435"
smart_detector_alert_rule_sub_tenant_id       = "687f51c3-0c5d-4905-84f8-97c683a5b9d1"