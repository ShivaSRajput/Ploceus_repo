// Resource Group Policy  Exemption Variable Declaration

variable "resource_group_policy_exemption_variables" {
  type = map(object({

    name                            = string
    exemption_category              = string
    policy_assignment_id            = string
    description                     = string
    display_name                    = string
    expires_on                      = string
    policy_definition_reference_ids = list(string)
    metadata                        = string
    resource_group_name             = string

  }))

}