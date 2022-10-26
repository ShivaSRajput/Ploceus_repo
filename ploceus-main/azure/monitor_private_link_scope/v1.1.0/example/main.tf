module "resource_group" {
  source                   = "../../../resource_group/v1.1.0"
  resource_group_variables = var.resource_group_variables
}
module "monitor_private_link_scope" {
  source        = "../"
  monitor_private_link_scope = var.monitor_private_link_scope

  depends_on = [
    module.resource_group
  ]
}