#RESOURCE GROUP for windows VMs
module "virtual_desktop_workspace_application_group_association" {
  source                                                    = "../"
  desktop_workspace_application_group_association_variables = var.desktop_workspace_application_group_association_variables
  depends_on = [
    module.virtual_desktop_application_group,
    module.virtual_desktop_workspaces
  ]
}

module "virtual_desktop_workspaces" {
  source                       = "../../../virtual_desktop_workspace/v1.1.0"
  desktop_workspaces_variables = var.desktop_workspaces_variables
  depends_on                   = [module.resource_group]
}

module "resource_group" {
  source                   = "../../../resource_group/v1.1.0"
  resource_group_variables = var.resource_group_variables
}

module "virtual_desktop_application_group" {
  source                              = "../../../virtual_desktop_application_group/v1.1.0"
  desktop_application_group_variables = var.desktop_application_group_variables
  depends_on = [
    module.resource_group,
    module.host_pool
  ]
}

module "host_pool" {
  source                      = "../../../virtual_desktop_host_pool/v1.1.0"
  desktop_host_pool_variables = var.desktop_host_pool_variables
  depends_on = [
    module.resource_group
  ]
}