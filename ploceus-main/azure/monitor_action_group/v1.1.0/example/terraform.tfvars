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
    enabled = false
     event_hub_receiver =  {}
     itsm_receiver = {} 
     logic_app_receiver = {} 
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
      Department = "CIS"
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

resource_group_variables = {
 "resource_group" = {
    name     = "ploceusrg000001"
    location = "westus2"
    resource_group_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

action_group_sub_subscription_id      = "7877d8aa-c51f-4741-b864-e77ef88cd435"
action_group_sub_tenant_id            = "687f51c3-0c5d-4905-84f8-97c683a5b9d1"