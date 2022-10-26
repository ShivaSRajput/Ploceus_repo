variable "resource_group_variables" {
  description = "Map of Resource groups"
  type = map(object({
    name                = string
    location            = string
    resource_group_tags = map(string)
  }))
  default = {}
}
variable "monitor_action_rule_suppression_variables" {

  description = "monitor_action_rule_suppression variables"
  type = map(object({
    name                = string
    resource_group_name = string
    description         = string
    enabled             = bool
    scope = object({
      type         = string
      resource_ids = string
    })
    suppression = object({
      recurrence_type = string

      schedule = object({
        start_date_utc = string
        end_date_utc   = string
        recurrence     = list(any)

      })

    })
    condition = object({
      alert_context = object({
        operator = string
        values   = set(string)
      })
      alert_rule_id = object({
        operator = string
        values   = set(string)
      })
      description = object({
        operator = string
        values   = set(string)
      })
      monitor = object({
        operator = string
        values   = set(string)
      })
      monitor_service = object({
        operator = string
        values   = set(string)
      })
      severity = object({
        operator = string
        values   = set(string)
      })
      target_resource_type = object({
        operator = string
        values   = set(string)
      })
    })
    tags = map(string)
  }))
  default = null

}




