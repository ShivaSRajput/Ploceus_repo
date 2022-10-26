# Passing inputs to the subscription policy exemption variables

subscription_policy_exemption_variables = {

  "policy_exemption_variables" = {

    subscription_policy_exemption_name                            = "ploceousexemption000001"
    subscription_policy_exemption_subscription_value              = "30b2728b-10ea-479a-98f4-7c61b2bac942"
    subscription_policy_exemption_category                        = "Mitigated" #Possible values are Waiver and Mitigated
    subscription_policy_exemption_policy_assignment_id            = "/subscriptions/30b2728b-10ea-479a-98f4-7c61b2bac942/providers/Microsoft.Authorization/policyAssignments/9c9aa645332d4d5aa5a12c3e"
    subscription_policy_exemption_description                     = "subscription policy  Exemption"
    subscription_policy_exemption_display_name                    = "ploceousexemption000001" # friendly name for the exemption
    subscription_policy_exemption_expires_on                      = "2022-10-31T23:59:00.000Z"
    subscription_policy_exemption_policy_definition_reference_ids = []
    subscription_policy_exemption_metadata                        = ""

  }

}
## Note 1 : There is no data block to read the assignment id , so please pass the assignment id as a manual input
## Note 2 : Policy defnition Reference ID arugument only works with the policy assignment which is using initiative policy definitions
## Note 3 : If we specify any definition reference id only that will be exempted otherwise all will be exempted
## Note 4 : Policy definition reference ids to be passed manually and the reference ids will be present to the definitions.