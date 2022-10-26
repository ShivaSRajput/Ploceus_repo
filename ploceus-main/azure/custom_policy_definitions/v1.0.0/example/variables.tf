variable "custom_policy_definition_variable" {
  type = map(object({
    name                =  string
    description         =  string
    location            =  string
    custom_policy       = object({
                                  display_name        = string
                                  mode                = string
                                  management_group_id = string
                                  metadata            = string
                                  policy_rule         = string
                                  parameters          = string
                                  })
  }))
}