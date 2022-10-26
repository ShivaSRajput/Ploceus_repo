variable "security_centre_automation_variables" {
  type = map(object({
    name                = string
    namespace           = string
    resource_group_name = string
    location            = string
    scopes              = list(string)
    event_source        = string
    property_path       = string
    operator            = string
    expected_value      = string
    property_type       = string
    actions = list(object({
      actions_type                = string
      actions_resource_name       = string
      actions_resource_group_name = string
      actions_connection_string   = string
      actions_trigger_url         = string
      actions_eventhub_namespace  = string

    }))
  }))
}
