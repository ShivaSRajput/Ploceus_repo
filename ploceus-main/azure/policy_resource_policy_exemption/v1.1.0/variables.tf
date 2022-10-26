// Resource Policy  Exemption Variable Declaration

variable "resource_policy_exemption_variables" {
  type = map(object({

    resource_policy_exemption_name                            = string
    resource_policy_exemption_category                        = string
    resource_policy_exemption_policy_assignment_id            = string
    resource_policy_exemption_description                     = string
    resource_policy_exemption_display_name                    = string
    resource_policy_exemption_expires_on                      = string
    resource_policy_exemption_policy_definition_reference_ids = list(string)
    resource_policy_exemption_metadata                        = string
    resource_policy_exemption_resource_name                   = string

  }))

}