variable "policy_set_definition_variable" {
  type = map(object({
    name                  = string
    policy_type           = string
    display_name          = string
    parameters            = string
    description           = string
    metadata              = string
    management_group_name = string
    policy_definition_reference = list(object({
      policy_definition_id = string
      parameter_values     = string
    }))
    policy_definition_group = list(object({
      name = string
    }))
  }))
}
