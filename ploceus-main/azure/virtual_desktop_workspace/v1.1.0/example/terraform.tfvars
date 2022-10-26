
#WORKSPACE
desktop_workspaces_variables = {
  "workspace" = {
    workspace_name                = "ploceusvdiworkspace000001"
    location                      = "westus2"
    workspace_resource_group_name = "ploceusrg000001"
    friendly_name                 = "ploceusvdi"
    description                   = "Workspace for Ploceus User"
    workspace_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

resource_group_variables = {
  "resource_group_1" = {
    name     = "ploceusrg000001"
    location = "westus2"
    resource_group_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}
 