# Locals to check which type of subscription is supposed to be created and the data block to be used
locals {
  is_ea_subscription  = { for k, v in var.subscription_variables : k => v if lookup(v, "subscription_type", null) == "EA" }
  is_mca_subscription = { for k, v in var.subscription_variables : k => v if lookup(v, "subscription_type", null) == "MCA" }
  is_mpa_subscription = { for k, v in var.subscription_variables : k => v if lookup(v, "subscription_type", null) == "MPA" }
}
# Data source for EA Subscription
data "azurerm_billing_enrollment_account_scope" "ea_subscription" {
  for_each                = local.is_ea_subscription
  billing_account_name    = each.value.ea_billing_account_name
  enrollment_account_name = each.value.ea_enrollment_account_name
}

# Data source for MCA Subscription
data "azurerm_billing_mca_account_scope" "mca_subscription" {
  for_each             = local.is_mca_subscription
  billing_account_name = each.value.mca_billing_account_name
  billing_profile_name = each.value.mca_billing_profile_name
  invoice_section_name = each.value.mca_invoice_section_name
}

# Data source for MPA Subscription
data "azurerm_billing_mpa_account_scope" "mpa_subscription" {
  for_each             = local.is_mpa_subscription
  billing_account_name = each.value.mpa_billing_account_name
  customer_name        = each.value.mpa_customer_name
}

# Resource block for Subscription
resource "azurerm_subscription" "subscription" {
  for_each          = var.subscription_variables
  alias             = each.value.subscription_alias
  subscription_name = each.value.subscription_name
  subscription_id   = each.value.subscription_id
  workload          = each.value.subscription_workload
  # Scope ID is defined based on the subscription type, the data block's ID would be imported accordingly. If type is Alias, this would be NULL
  billing_scope_id = each.value.subscription_type == "EA" ? data.azurerm_billing_enrollment_account_scope.ea_subscription[each.key].id : (each.value.subscription_type == "MCA" ? data.azurerm_billing_mca_account_scope.mca_subscription[each.key].id : (each.value.subscription_type == "MPA" ? data.azurerm_billing_mpa_account_scope.mpa_subscription[each.key].id : null))
  tags             = merge(each.value.subscription_tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
  lifecycle { ignore_changes = [tags["Created_Time"]] }
}

