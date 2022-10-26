role_definition_variables = {
  "role_definition_1"   = {
    name                = "Ploceus-Role-Definition-001"
    scope               = "/subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333"
    description         = "Role definition 1 with scope at subscription level only"
    permissions         = {
      actions           = [ "microsoft.aadiam/azureADMetrics/read",
                            "microsoft.aadiam/azureADMetrics/write",
                            "microsoft.aadiam/privateLinkForAzureAD/read",
                            "microsoft.aadiam/privateLinkForAzureAD/write" ]
      data_actions      = []
      not_actions       = [ "microsoft.operationalinsights/unregister/action",
                            "Microsoft.OperationalInsights/register/action",
                            "Microsoft.OperationalInsights/clusters/delete",
                            "microsoft.operationalinsights/operations/read" ]
      not_data_actions  = []
    }
    assignable_scopes   = ["/subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333/resourceGroups/myGroup","/subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333/resourceGroups/myGroup/providers/Microsoft.Compute/virtualMachines/myVM"]
  }
}
