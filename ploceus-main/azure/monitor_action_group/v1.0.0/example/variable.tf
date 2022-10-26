variable "azurerm_monitor_action_group" {
  type = map(object({
    name       = string
    short_name = string
  }))
  default = {
    actionGroup_1 = {
      #The name of the Action Group
      name : "action"
      #The short/ display name of the action group.
      short_name : "actionDisplay"
    }
  }
}

variable "resource_group_name" {
  type        = string
  description = "Specifies the name of the Resource Group"
  default     = "CIS"
}

variable "email_receiver" {
  type        = list(map(string))
  description = "Specifies one or more email_receiver blocks"
  default     = []
}

variable "arm_role_receiver" {
  type        = list(map(string))
  description = "Specifies one or more arm_role_receiver blocks"
  default     = []
}

variable "automation_runbook_receiver" {
  type        = list(map(string))
  description = "Specifies one or more automation_runbook_receiver blocks"
  default     = []
}

variable "azure_app_push_receiver" {
  type        = list(map(string))
  description = "Specifies one or more azure_app_push_receiver blocks"
  default     = []
}

variable "azure_function_receiver" {
  type        = list(map(string))
  description = "Specifies one or more azure_function_receiver blocks"
  default     = []
}

variable "itsm_receiver" {
  type        = list(map(string))
  description = "Specifies one or more itsm_receiver blocks"
  default     = []
}

variable "logic_app_receiver" {
  type        = list(map(string))
  description = "Specifies one or more logic_app_receiver blocks"
  default     = []
}

variable "sms_receiver" {
  type        = list(map(string))
  description = "Specifies one or more sms_receiver blocks"
  default     = []
}

variable "voice_receiver" {
  type        = list(map(string))
  description = "Specifies one or more voice_receiver blocks"
  default     = []
}

variable "webhook_receiver" {
  type        = list(map(string))
  description = "Specifies one or more webhook_receiver blocks"
  default     = []
}

variable "azurerm_monitor_action_group_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource"
  default     = {}
}

variable "subscription_id" {
  type        = string
  description = "Specifies subscription_id"
  default     = "XXXXXXXXX000000000000"
}

variable "client_secret" {
  type        = string
  description = "Specifies client_secret"
  default     = "XXXXXXXXX000000000000"
}

variable "client_id" {
  type        = string
  description = "Specifies client_id"
  default     = "XXXXXXXXX000000000000"
}

variable "tenant_id" {
  type        = string
  description = "Specifies tenant_id"
  default     = "XXXXXXXXX000000000000"
}



