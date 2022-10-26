#RESOURCE GROUP for windows VMs
module "virtual_desktop_workspaces" {
  source                       = "../"
  desktop_workspaces_variables = var.desktop_workspaces_variables
  depends_on                   = [module.resource_group]
}

module "resource_group" {
  source                   = "../../../resource_group/v1.1.0"
  resource_group_variables = var.resource_group_variables
}