// Policy Definition Variable Declaration
variable "custom_policy_definition_variable" {
  type = map(object({
    name        = string
    description = string
    location    = string
    custom_policy = object({
      display_name        = string
      mode                = string
      management_group_id = string
      metadata            = string
      policy_rule         = string
      parameters          = string
    })
  }))
  default = {}
}
// Policy Assignment Variable Declaration
variable "subscription_policy_variables" {
  description = "Map of policy assignment names"
  type = map(object({
    name                           = string
    is_policy_definition_is_set     = bool
    resource_group_name            = string
    policy_definition_name         = string
    parameters                     = string
    description                    = string
    display_name                   = string
    enforce                        = bool
    user_assigned_identity_name    = string
    is_user_identity_required      = bool
    is_user_identity_import_needed = bool
    is_user_identity_exists        = bool
    is_identity_required           = bool
    
      identity_type         = string
      identity_ids = list(string)
    
    location                              = string
    metadata                              = string
    non_compliance_message_required = bool
    non_compliance_policy_definition_is_set = bool  #Must be true if its policy set defination
    non_compliance_message  = object({
    non_compliance_policy_definition_name = string 
    content                = string
  })
    not_scopes                            = list(string)
  }))
  default = null
}
