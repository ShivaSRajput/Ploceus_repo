variable "resource_policy_variables" {
  description = "Map of RG policy resource assignment"
  type = map(object({
    name                           = string
    resource_id                    = string
    resource_group_name            = string
    is_policy_definition_exist     = bool
    policy_definition_id           = string
    policy_definition_name         = string
    parameters                     = string
    description                    = string
    display_name                   = string
    enforce                        = bool
    user_assigned_identity_name    = string
    is_user_identity_required      = bool
    is_user_identity_import_needed = bool
    is_user_identity_exists        = bool
    identity = object({
      type         = string
      identity_ids = list(string)
    })
    location                              = string
    metadata                              = string
    non_compliance_message                = map(string)
    policy_definition_reference_exists    = bool
    non_compliance_policy_definition_name = string
    not_scopes                            = list(string)
  }))
  default = null
}
