module "virtual_desktop_application" {
  source                = "../"
  desktop_application_variables = var.desktop_application_variables
  depends_on = [
    module.resource_group,
    module.host_pool,
    module.virtual_desktop_application_group
  ]
}

module "virtual_desktop_application_group" {
  source              = "../../../virtual_desktop_application_group/v1.1.0"
  desktop_application_group_variables = var.desktop_application_group_variables
  depends_on = [
    module.resource_group,
    module.host_pool
  ]
}

module "resource_group" {
  source = "../../../resource_group/v1.1.0"
  resource_group_variables = var.resource_group_variables
}

module "host_pool" {
  source = "../../../virtual_desktop_host_pool/v1.1.0"
  desktop_host_pool_variables = var.desktop_host_pool_variables
  depends_on = [
    module.resource_group
  ]
}