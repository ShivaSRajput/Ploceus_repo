security_center_assessment_variables = {
  "security_center_assessment_1" = {
    policy_description   = "Ploceus security center assessment policy"
    policy_display_name  = "ploceussecuritycenterpolicy000001"
    policy_severity      = "High"
    virtual_machine_name = "ploceusvm000001"
    virtual_machine_rg   = "ploceusrg000001"
    additional_data = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
    status = [{
      code        = "Unhealthy"                     # Possible values are Healthy, Unhealthy and NotApplicable.
      cause       = "security breach into the VM"   # Specifies the cause of the assessment status.
      description = "status of the Vm is Unhealthy" # Specifies the human readable description of the assessment status.
    }]
  }
}
virtual_machine_subscription_id            = "e3d2d88d-b54a-4fb7-b918-3cb24aad9ba9"
virtual_machine_tenant_id                  = "687f51c3-0c5d-4905-84f8-97c683a5b9d1"
security_center_assessment_subscription_id = "e3d2d88d-b54a-4fb7-b918-3cb24aad9ba9"
security_center_assessment_tenant_id       = "687f51c3-0c5d-4905-84f8-97c683a5b9d1"
