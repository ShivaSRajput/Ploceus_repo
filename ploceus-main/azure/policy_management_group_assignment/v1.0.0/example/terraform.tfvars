// ************** Policy Definition Data **************
custom_policy_definition_variable = {
  "custom_policy_definition_1" = {
    name        = "restrict-location-mg"
    description = "Restrict location that its allowed to create resources in."
    location    = "centralindia"

    custom_policy = {
      display_name        = "Restrict location MG"
      mode                = "All"
      management_group_id = null
      metadata            = <<METADATA
          {
            "category": "General"
          }
        METADATA

      policy_rule = <<POLICY_RULE
          {
      "if": {
        "anyOf": [
          {
            "allOf": [
              {
                "field": "type",
                "equals": "Microsoft.Compute/virtualMachines"
              },
              {
                "field": "Microsoft.Compute/virtualMachines/osDisk.uri",
                "exists": "True"
              }
            ]
          },
          {
            "allOf": [
              {
                "field": "type",
                "equals": "Microsoft.Compute/VirtualMachineScaleSets"
              },
              {
                "anyOf": [
                  {
                    "field": "Microsoft.Compute/VirtualMachineScaleSets/osDisk.vhdContainers",
                    "exists": "True"
                  },
                  {
                    "field": "Microsoft.Compute/VirtualMachineScaleSets/osdisk.imageUrl",
                    "exists": "True"
                  }
                ]
              }
            ]
          }
        ]
      },
      "then": {
        "effect": "audit"
      }
  }
        POLICY_RULE

      parameters = <<PARAMETERS
          {}
        PARAMETERS
    }

    assignments = [
      {
        display_name = "Restrict resource location"
        id           = "/subscriptions/bc80f62c-4300-4e77-b53b-d17425e47e05"
        not_scopes   = []
        parameters   = <<PARAMETERS
            {
              "allowedLocations": {
                "value": [ "centralindia" ]
              }
            }
          PARAMETERS
      },
    ]

  }
}
//******************** Policy Assignment Data *******************
management_group_policy_variables = {
  policy_management_group_assignment_1 = {
    name                           = "ploceus_policy_mg_group1"
    is_management_group_exist      = false
    management_group_name          = "ploceus-mg-0001"
    management_group_id            = ""
    resource_group_name            = "ploceus-rg-0001"
    is_policy_definition_exist     = false
    policy_definition_name         = "Restrict location MG"
    policy_definition_id           = ""
    parameters                     = <<PARAMETERS
            {}
          PARAMETERS
    description                    = "Assignment of the Monitoring Governance initiative to management group level"
    display_name                   = "Monitoring Governance"
    enforce                        = false
    user_assigned_identity_name    = ""
    is_user_identity_required      = false
    is_user_identity_exists        = false
    is_user_identity_import_needed = false
    identity = {
      type         = "SystemAssigned"
      identity_ids = []
    }
    location                              = "centralindia"
    metadata                              = null
    policy_definition_reference_exists    = true
    non_compliance_policy_definition_name = "SQL Server Integration Services integration runtimes on Azure Data Factory should be joined to a virtual network"
    non_compliance_message = {
      content                        = "Default message"
      policy_definition_reference_id = null
    }
    not_scopes = []
  }
  policy_management_group_assignment_2 = {
    name                           = "ploceus_policy_mg_group2"
    is_management_group_exist      = false
    management_group_name          = "ploceus-mg-0002"
    management_group_id            = ""
    resource_group_name            = "ploceus-rg-0001"
    is_policy_definition_exist     = false
    policy_definition_name         = "Restrict location MG"
    policy_definition_id           = ""
    parameters                     = <<PARAMETERS
            {}
          PARAMETERS
    description                    = "Assignment of the Monitoring Governance initiative to management group level"
    display_name                   = "Monitoring Governance"
    enforce                        = false
    user_assigned_identity_name    = "pl_managed_identity"
    is_user_identity_required      = true
    is_user_identity_exists        = true
    is_user_identity_import_needed = false
    identity = {
      type         = "UserAssigned"
      identity_ids = ["/subscriptions/c4f23f90-919c-4d2f-bb60-3a5c1dc705cc/resourceGroups/sample-rg/providers/Microsoft.ManagedIdentity/userAssignedIdentities/user_managed_identity"]
    }
    location                              = "centralindia"
    metadata                              = null
    policy_definition_reference_exists    = true
    non_compliance_policy_definition_name = "SQL Server Integration Services integration runtimes on Azure Data Factory should be joined to a virtual network"
    non_compliance_message = {
      content                        = "Default message"
      policy_definition_reference_id = null
    }
    not_scopes = []
  }
}
