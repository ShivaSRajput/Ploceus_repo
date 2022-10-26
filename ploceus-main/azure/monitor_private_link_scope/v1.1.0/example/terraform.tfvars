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

monitor_private_link_scope = {
  "scope1" = {
    name                                 = "scope1"
    resource_group_name                  = "ploceusrg000001"
    tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}