variable "security_center_assessment_policy_variables" {
  type = map(object({
    description             = string
    display_name            = string
    severity                = string
    categories              = list(string)
    implementation_effort   = string
    remediation_description = string
    threats                 = list(string)
    user_impact             = string
  }))
}
