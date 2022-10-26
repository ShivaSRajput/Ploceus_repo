## Variables Declaration for Subscription Policy Remediation

variable "subscription_policy_remediation_variables" {
  type = map(object({

    subscription_policy_remediation_name                    = string
    subscription_policy_remediation_policy_assignment_id    = string
    subscription_policy_remediation_policy_definition_id    = string
    subscription_policy_remediation_location_filters        = list(string)
    subscription_policy_remediation_resource_discovery_mode = string
    subscription_policy_remediation_subscription_value      = string
  }))

}