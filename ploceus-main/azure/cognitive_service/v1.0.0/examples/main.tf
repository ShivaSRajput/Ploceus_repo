#RESOURCE GROUP
module "resource_group" {
  source                   = "../../../resource_group/v1.0.0"
  resource_group_variables = var.resource_group_variables
}

#Cognitive Account
module "cognitive_account" {
  source            = "../"
  tags              = var.tags
  cognitive_account = var.cognitive_account



}
