######### Custom policy ############### 
custom_policy_definition_variable = {
  "custom_policy_definition_1" = {
      name        = "restrict-location"
      description = "Restrict location that its allowed to create resources in."
      location    = "westeurope"

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
          display_name    = "Restrict resource location"
          id = "/subscriptions/bc80f62c-4300-4e77-b53b-d17425e47e05"
          not_scopes      = []
          parameters      = <<PARAMETERS
            {
              "allowedLocations": {
                "value": [ "West Europe" ]
              }
            }
          PARAMETERS
        },
      ]

  },

  "custom_policy_definition_2" = {
      name        = "restrict-location-01"
      description = "Restrict location that its allowed to create resources in."
      location    = "westeurope"

      custom_policy = {
        display_name = "Restrict location 02"
        mode         = "All"

        management_group_id = "Test_group"

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
          display_name    = "Restrict resource location"
          id = "/subscriptions/bc80f62c-4300-4e77-b53b-d17425e47e05"
          not_scopes      = []
          parameters      = <<PARAMETERS
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


  
  
