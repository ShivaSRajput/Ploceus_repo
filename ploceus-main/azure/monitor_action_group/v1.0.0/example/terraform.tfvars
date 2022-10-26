# To skip any of the action simply pass empty list
azurerm_monitor_action_group = {
  test = {
    name       = "test"
    short_name = "test"
  },
}

resource_group_name = "naga"

email_receiver = [
  {
    name                    = "test"
    email_address           = "suraj.patil@neudesic.com"
    use_common_alert_schema = true
  },
]

arm_role_receiver = [
  {
    name                    = "testsuraj"
    role_id                 = "XXXXXXXXXXXXXXXXXX"
    use_common_alert_schema = true
  },
]

automation_runbook_receiver = [
  {
    name                    = "action_name_1"
    automation_account_id   = "/subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/rg-runbooks/providers/microsoft.automation/automationaccounts/aaa001"
    runbook_name            = "my runbook"
    webhook_resource_id     = "/subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/rg-runbooks/providers/microsoft.automation/automationaccounts/aaa001/webhooks/webhook_alert"
    is_global_runbook       = true
    service_uri             = "https://s13events.azure-automation.net/webhooks?token=randomtoken"
    use_common_alert_schema = true
  },
]

azure_app_push_receiver = [
  {
    name          = "suraj"
    email_address = "suraj.patil@neudesic.com"
  },
]

azure_function_receiver = [
  {
    name                     = "funcaction"
    function_app_resource_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-funcapp/providers/Microsoft.Web/sites/funcapp"
    function_name            = "myfunc"
    http_trigger_url         = "https://example.com/trigger"
    use_common_alert_schema  = true
  },
]

itsm_receiver = [
  {
    name                 = "createorupdateticket"
    workspace_id         = "XXXXXXXXXXXXXXXXXXXXXX1"
    connection_id        = "XXXXXXXXXXXXXXXXXXXXXX13"
    ticket_configuration = "{}"
    region               = "southcentralus"
  },
]

logic_app_receiver = [
  {
    name                    = "logicappaction"
    resource_id             = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-logicapp/providers/Microsoft.Logic/workflows/logicapp"
    callback_url            = "https://logicapptriggerurl/..."
    use_common_alert_schema = true
  },
]

sms_receiver = [
  {
    name         = "oncallmsg"
    country_code = "1"
    phone_number = "7588257977"
  },
  {
    name         = "oncallmsg121"
    country_code = "1"
    phone_number = "7588257933"
  },
]

voice_receiver = [
  {
    name         = "remotesupport"
    country_code = "1"
    phone_number = "7588257977"
  },
]

webhook_receiver = [
  {
    name                    = "callmyapiaswell"
    service_uri             = "http://example.com/alert"
    use_common_alert_schema = true
  },
]

azurerm_monitor_action_group_tags = {
  iac = "terraform"
  env = "dev"
}

