#RESOURCE GROUP for windows VMs
module "virtual_desktop_workspaces" {
  source               = "../"
  workspaces_variables = var.workspaces_variables
}

