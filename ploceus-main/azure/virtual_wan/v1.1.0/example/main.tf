#RESOURCE GROUP
module "resource_group" {
  source                   = "../../../resource_group/v1.1.0"
  resource_group_variables = var.resource_group_variables
}


#VIRTUAL WAN
module "virtual_wan" {
  source                = "../"
  virtual_wan_variables = var.virtual_wan_variables
  depends_on = [
    module.resource_group
  ]
}
