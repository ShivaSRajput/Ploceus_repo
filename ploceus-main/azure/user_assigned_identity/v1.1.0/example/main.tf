#RESOURCE GROUP
module "resource_group" {
  source                   = "../../../resource_group/v1.1.0"
  resource_group_variables = var.resource_group_variables
}

#USER ASSIGNED IDENTITY
module "user_assigned_identity" {
  source                           = "../"
  user_assigned_identity_variables = var.user_assigned_identity_variables
  depends_on = [
    module.resource_group
  ]
}
