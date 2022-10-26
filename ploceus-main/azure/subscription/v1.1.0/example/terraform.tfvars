subscription_variables = {
  "subscription_1" = {
    subscription_type = "Alias" # Values possible are EA, MCA, MPA and Alias
    #If type is EA, pass these values as "string"
    ea_billing_account_name    = null
    ea_enrollment_account_name = null
    #If type is MCA, pass these values as "string"
    mca_billing_account_name = null
    mca_billing_profile_name = null
    mca_invoice_section_name = null
    #If type is MPA, pass these values as "string"
    mpa_billing_account_name = null
    mpa_customer_name        = null
    #If type is Alias, pass these values as "string"
    subscription_alias = "Visual Studio Subcription - Dev 12"
    subscription_name  = "VS-Prof-Dev-12"
    subscription_id    = "070e769c-b870-488d-ad31-3707ced9fedf"
    #Other Inputs
    subscription_workload = "Production" # Default is Production, other possible one is DevTest
    subscription_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}