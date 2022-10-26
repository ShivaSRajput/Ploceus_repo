policy_set_definition_variable = {
  "policy_set_definition_1" = {
    name                  = "policy-set-restrict-location-1"
    policy_type           = "Custom"
    display_name          = "policy_set_restrict_location"
    parameters            = <<PARAMETERS
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
    description           = "Policy_Set_Definition having multiple Policy id to restrict locations"
    metadata              = <<METADATA
    {
    "category": "General"
    }
    METADATA
    management_group_name = "Policy_Set_Definition_MG"
    policy_definition_reference = [
      {
        policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/e56962a6-4747-49cd-b67b-bf8b01975c4c"
        parameter_values     = <<VALUE
    {
      "listOfAllowedLocations": {"value": "[parameters('allowedLocations')]"}
    }
    VALUE
      },
      {
        policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/e765b5de-1225-4ba3-bd56-1ac6695af988"
        parameter_values     = <<VALUE
    {
      "listOfAllowedLocations": {"value": "[parameters('allowedLocations')]"}
    }
    VALUE
      }

    ]
    policy_definition_group = [
      {
        name = "Restrict_location_group"
      }
    ]



  }

}
