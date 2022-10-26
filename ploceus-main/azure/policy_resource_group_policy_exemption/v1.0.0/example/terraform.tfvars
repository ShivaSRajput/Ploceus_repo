# Passing inputs to the Resource Group policy exemption variables
resource_group_policy_exemption_variables = {
  "policy_exemption_variables" = {

    name                            = "ploceousexemprg000001"
    resource_group_name             = "ploceousrg000001"
    exemption_category              = "Mitigated" #Possible values are Waiver and Mitigated
    policy_assignment_id            = "/subscriptions/XXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX/resourceGroups/RG1/providers/Microsoft.Authorization/policyAssignments/XXXXXXXXXXXXXXXXXXXX"
    description                     = "Resource Group Policy set Exemption"
    display_name                    = "ploceousexemprg000001" # friendly name for the  exemption
    expires_on                      = "2022-10-31T23:59:00.000Z"
    policy_definition_reference_ids = ["azureBackupShouldBeEnabledForVirtualMachinesMonitoringEffect"]
    metadata                        = ""
  }
}
## Note 1 : There is no data block to read the assignment id , so please pass the assignment id as a manual input
## Note 2: Policy defnition Reference ID arugument only works with the policy assignment which is using initiative policy definitions
## Note 3:  If we specify any definition reference id only that will be exempted otherwise all will be exempted
## Note 4 : Policy definition reference ids to be passed manually and the reference ids will be present to the definitions.