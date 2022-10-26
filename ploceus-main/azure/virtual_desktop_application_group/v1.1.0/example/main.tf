#virtual_desktop_host_pool_registration_info
module "virtual_desktop_application_group" {
  source                              = "../"
  desktop_application_group_variables = var.desktop_application_group_variables
  depends_on = [
    module.resource_group,
    module.host_pool
  ]
}

module "resource_group" {
  source                   = "../../../resource_group/v1.1.0"
  resource_group_variables = var.resource_group_variables
}

module "host_pool" {
  source                      = "../../../virtual_desktop_host_pool/v1.1.0"
  desktop_host_pool_variables = var.desktop_host_pool_variables
  depends_on = [
    module.resource_group
  ]
}