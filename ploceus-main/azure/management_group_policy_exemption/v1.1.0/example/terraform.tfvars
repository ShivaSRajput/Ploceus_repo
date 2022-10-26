# Passing inputs to the Management policy exemption variables

management_group_policy_exemption_variables = {

  "policy_exemption_variables" = {

    management_group_policy_exemption_name                            = "ploceusmg000001"
    management_group_policy_exemption_category                        = "Mitigated" #Possible values are Waiver and Mitigated
    management_group_policy_exemption_description                     = "Management Group Policy Exemption"
    management_group_policy_exemption_display_name                    = "ploceusmg000001" # friendly name for the exemption
    management_group_policy_exemption_expires_on                      = "2022-10-31T23:59:00.000Z"
    management_group_policy_exemption_policy_assignment_id            = "/providers/Microsoft.Management/managementGroups/mymanagement/providers/Microsoft.Authorization/policyAssignments/4aca303044b14f9a8d43d775"
    management_group_policy_exemption_policy_definition_reference_ids = []
    management_group_policy_exemption_metadata                        = ""
    management_group_policy_exemption_management_group_display_name   = "ploceousexemp000001" ## Passing this input to data block to fetch the management id
  }

}

## Note 1 : There is no data block to read the assignment id , so please pass the assignment id as a manual input
## Note 2 : Policy defnition Reference ID arugument only works with the policy assignment which is using initiative policy definitions
## Note 3 : If we specify any definition reference id only that will be exempted otherwise all will be exempted
## Note 4 : The scope of policy assignment should be at management level
## Note 5 : Policy definition reference ids to be passed manually and the reference ids will be present to the definitions.