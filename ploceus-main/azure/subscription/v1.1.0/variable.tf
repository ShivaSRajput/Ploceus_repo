# Subscription Variables
variable "subscription_variables" {
  type = map(object({
    subscription_type          = string
    ea_billing_account_name    = string
    ea_enrollment_account_name = string
    mca_billing_account_name   = string
    mca_billing_profile_name   = string
    mca_invoice_section_name   = string
    mpa_billing_account_name   = string
    mpa_customer_name          = string
    subscription_alias         = string
    subscription_name          = string
    subscription_id            = string
    subscription_workload      = string
    subscription_tags          = map(string)
  }))
}






