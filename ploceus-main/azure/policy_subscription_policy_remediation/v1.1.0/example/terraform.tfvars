## Passing inputs to the subscription policy Remediation variables

subscription_policy_remediation_variables = {

  "policy_remediation_variables" = {

    subscription_policy_remediation_name                    = "ploceousremedy000004"
    subscription_policy_remediation_subscription_value      = "30b2728b-10ea-479a-98f4-7c61b2bac942"
    subscription_policy_remediation_policy_assignment_id    = "/subscriptions/30b2728b-10ea-479a-98f4-7c61b2bac942/providers/Microsoft.Authorization/policyAssignments/fa5715e67066491b9b9fb783"
    subscription_policy_remediation_policy_definition_id    = null
    subscription_policy_remediation_location_filters        = ["East US"]
    subscription_policy_remediation_resource_discovery_mode = "ReEvaluateCompliance" # Possible values ExistingNonCompliant, ReEvaluateCompliance. Defaults to ExistingNonCompliant.

  }

}
## Note 1 : There is no data block to read the assignment id , so please pass the assignment id as a manual input
## Note 2 : Remediation supports policies with deployifnotexist or modify effects.
## Note 3 : Link for Note 1 : https://learn.microsoft.com/en-us/azure/governance/policy/how-to/remediate-resources?tabs=azure-portal
## Note 4 : Please use policy definitions to work with module
## Note 5 : policy set definitions will not work with this module.
## Note 6 : In order to work with policy set definitions , please use terraform provider version 3.23.0 and its associated aruguments