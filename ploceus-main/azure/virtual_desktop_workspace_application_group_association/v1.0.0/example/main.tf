#RESOURCE GROUP for windows VMs
module "virtual_desktop_workspace_application_group_association" {
  source              = "../"
  appgroups_variables = var.association_variable
}

