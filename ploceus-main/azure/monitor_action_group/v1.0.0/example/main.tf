data "azurerm_resource_group" "resource_group_search" {
  count = local.resourcegroup_state_exists == false ? 1 : 0
  name  = var.resource_group_name
}

locals {
  resourcegroup_state_exists = false
}

module "actionGroup" {
  source                            = "../../../action_group/v1.0.0"
  azurerm_monitor_action_group      = var.azurerm_monitor_action_group
  resource_group_name               = local.resourcegroup_state_exists == true ? var.resource_group_name : data.azurerm_resource_group.resource_group_search.0.name
  email_receiver                    = var.email_receiver
  arm_role_receiver                 = var.arm_role_receiver
  automation_runbook_receiver       = var.automation_runbook_receiver
  azure_app_push_receiver           = var.azure_app_push_receiver
  azure_function_receiver           = var.azure_function_receiver
  itsm_receiver                     = var.itsm_receiver
  logic_app_receiver                = var.logic_app_receiver
  sms_receiver                      = var.sms_receiver
  voice_receiver                    = var.voice_receiver
  webhook_receiver                  = var.webhook_receiver
  azurerm_monitor_action_group_tags = var.azurerm_monitor_action_group_tags
}


