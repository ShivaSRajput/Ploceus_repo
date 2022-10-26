variable "security_center_assessment_variables" {
  type = map(object({
    additional_data      = map(string)
    policy_description   = string
    policy_display_name  = string
    policy_severity      = string
    virtual_machine_name = string
    virtual_machine_rg   = string
    status = list(object({
      code        = string
      cause       = string
      description = string
    }))
  }))
}
