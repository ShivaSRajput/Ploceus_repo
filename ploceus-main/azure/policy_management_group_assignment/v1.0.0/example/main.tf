module "custom_policy_definitions" {
  source                            = "../../../custom_policy_definitions/v1.0.0"
  custom_policy_definition_variable = var.custom_policy_definition_variable
}

module "policy_management_group_assignment" {
  source                            = "../"
  management_group_policy_variables = var.management_group_policy_variables
  depends_on = [
    module.custom_policy_definitions
  ]
}