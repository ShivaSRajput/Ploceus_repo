// ************** Policy Definition Data **************
custom_policy_definition_variable = {
  "custom_policy_definition_1" = {
    name        = "restrict-location"
    description = "Restrict location that its allowed to create resources in."
    location    = "centralindia"

    custom_policy = {
      display_name = "Restrict location"
      mode         = "All"

      management_group_id = null

      metadata = <<METADATA
          {
            "category": "General"
          }
        METADATA

      policy_rule = <<POLICY_RULE
          {
            "if": {
              "not": {
                "field": "location",
                "in": "[parameters('allowedLocations')]"
              }
            },
            "then": {
              "effect": "audit"
            }
          }
        POLICY_RULE

      parameters = <<PARAMETERS
          {
            "allowedLocations": {
              "type": "Array",
              "metadata": {
                "description": "The list of allowed locations for resources.",
                "displayName": "Allowed locations",
                "strongType": "location"
              }
            }
          }
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
                "value": [ "West Europe" ]
              }
            }
          PARAMETERS
      },
    ]

  }
}
//******************** Policy Assignment Data *******************
subscription_policy_variables = {
  policy_subscription_assignment = {
    name                           = "ploceussubpolicy01"
    resource_group_name            = "ploceus-rg-0001"
    is_policy_definition_exist     = false
    policy_definition_name         = "Restrict location"
    policy_definition_id           = ""
    parameters                     = <<PARAMETERS
  {
    "allowedLocations": {
      "value": [ "centralindia" ]
    }
  }
PARAMETERS
    description                    = "Assignment of the Monitoring Governance initiative to subscription."
    display_name                   = "Monitoring Governance"
    enforce                        = false
    user_assigned_identity_name    = "pl_managed_identity2"
    is_user_identity_required      = true
    is_user_identity_exists        = true
    is_user_identity_import_needed = false
    identity = {
      type         = "UserAssigned"
      identity_ids = ["/subscriptions/c4f23f90-919c-4d2f-bb60-3a5c1dc705cc/resourceGroups/sample-rg/providers/Microsoft.ManagedIdentity/userAssignedIdentities/user_managed_identity"]
    }
    location                              = "centralindia"
    metadata                              = <<METADATA
          {
            "category": "General"
          }
        METADATA
    policy_definition_reference_exists    = true
    non_compliance_policy_definition_name = "SQL Server Integration Services integration runtimes on Azure Data Factory should be joined to a virtual network"
    non_compliance_message = {
      content                        = "Default message"
      policy_definition_reference_id = null
    }
    not_scopes = []
  }
}