#USER ASSIGNED IDENTITY
user_assigned_identity_variables = {
  "uai1" = {
    user_assigned_identity_name                = "ploceusuai000001"
    user_assigned_identity_location            = "westus2"
    user_assigned_identity_resource_group_name = "ploceusrg000001"
    user_assigned_identity_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

#RESOURCE GROUP 
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

