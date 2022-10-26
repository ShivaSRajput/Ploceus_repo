module "custom_policy_definitions" {
  source                            = "../../../custom_policy_definitions/v1.0.0"
  custom_policy_definition_variable = var.custom_policy_definition_variable
}

module "policy_subscription_assignment" {
  source                        = "../"
  subscription_policy_variables = var.subscription_policy_variables
  depends_on = [
    module.custom_policy_definitions
  ]
}