## Variables Declaration for Subscription Policy Exemption

variable "subscription_policy_exemption_variables" {
  type = map(object({

    subscription_policy_exemption_name                            = string
    subscription_policy_exemption_subscription_value              = string
    subscription_policy_exemption_category                        = string
    subscription_policy_exemption_policy_assignment_id            = string
    subscription_policy_exemption_description                     = string
    subscription_policy_exemption_display_name                    = string
    subscription_policy_exemption_expires_on                      = string
    subscription_policy_exemption_policy_definition_reference_ids = list(string)
    subscription_policy_exemption_metadata                        = string
  }))

}