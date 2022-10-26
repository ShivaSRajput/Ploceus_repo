variable "role_definition_variables" {
  type = map(object({
    name                      = string
    scope                     = string  
    description               = string
    permissions = object({
      actions                 = list(string)
      not_actions             = list(string)
      data_actions            = list(string)
      not_data_actions        = list(string)
    })
    assignable_scopes         = list(string)
  }))
  }
