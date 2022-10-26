// Management Group Policy  Exemption Variable Declaration

variable "management_group_policy_exemption_variables" {
  type = map(object({

    management_group_policy_exemption_name                            = string
    management_group_policy_exemption_category                        = string
    management_group_policy_exemption_policy_assignment_id            = string
    management_group_policy_exemption_description                     = string
    management_group_policy_exemption_display_name                    = string
    management_group_policy_exemption_expires_on                      = string
    management_group_policy_exemption_policy_definition_reference_ids = list(string)
    management_group_policy_exemption_metadata                        = string
    management_group_policy_exemption_management_group_display_name   = string

  }))
}
