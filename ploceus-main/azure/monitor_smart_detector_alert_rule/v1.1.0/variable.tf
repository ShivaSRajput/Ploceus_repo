#variable definition for monitor_smart_detector_alert_rules
variable "smart_detector_alert_rules" {
  type = map(object({
    name                = string
    resource_group_name = string
    detector_type       = string
    scope_resources = map(object({ #Only 1 Scope allowed
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