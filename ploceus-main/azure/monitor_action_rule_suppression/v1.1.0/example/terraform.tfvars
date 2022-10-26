################################################################################################################################################################
#resource group variables
#################################################################################################################################################################

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

################################################################################################################################################################
#action rule suppression variables
#################################################################################################################################################################

monitor_action_rule_suppression_variables = {
  "action_rule_suppression_1" = {
    name                = "ploceussuppressionrule000001"
    resource_group_name = "ploceusrg000001"

    ################################################################################################################################################################
    #scope is optional
    ################################################################################################################################################################

    scope = {
      type         = "Resource" # type can be either Resource or Resourcegroup
      resource_ids = "ploceusvnet000001"     # Enter name of the resource group here or the resource name
    }
    ###############################################################################################################################################################
    #suppression is required
    #################################################################################################################################################################

    suppression = {
      recurrence_type = "Monthly"
      ################################################################################################################################################################
      #schedule is Optional {Required if recurrence_type is Daily, Monthly, Once or Weekly}
      ################################################################################################################################################################

      schedule = {
        start_date_utc = "2022-12-01T01:02:03Z"
        end_date_utc   = "2023-10-03T15:02:07Z"
        recurrence     = [1, 2, 5, 7, 9]
      }
    }
    ##############################################################################################################################################################
    #condition is Optional 
    ################################################################################################################################################################

    condition = {
      alert_context = {
        operator = "Equals"
        values   = ["xxxxxxxx_email@neudesic.com"]
      }
      alert_rule_id = {
        operator = "Equals"
        //alert rule has no data source, hence passing manually.
        values   = ["/subscriptions/e228a3c6-cc6e-4fea-87f3-fafa70c85d19/resourceGroups/ploceusrg000001/providers//Microsoft.AlertsManagement/ploceusactionRules000001/ploceusaction000001"]
      }
      description = {
        operator = "Equals"
        values   = ["Created by Ploceus"]
      }
      monitor = {
        operator = "Equals"
        values   = ["Resolved"]
      }
      monitor_service = {
        operator = "Equals"
        values   = ["Resource Health"]
      }
      severity = {
        operator = "Equals"
        values   = ["Sev0"]
      }
      target_resource_type = {
        operator = "Equals"
        values   = ["get"]
      }
    }
    description = "new action"
    enabled     = true

    tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
  "action_rule_suppression_2" = {
    name                = "ploceussuppressionrule000002"
    resource_group_name = "ploceusrg000001"

    ################################################################################################################################################################
    #scope is optional
    ################################################################################################################################################################

    scope = {
      type         = "ResourceGroup" # type can be either Resource or Resourcegroup
      resource_ids = "ploceusrg000001"     # Enter name of the resource group here or the resource name
    }
    ###############################################################################################################################################################
    #suppression is required
    #################################################################################################################################################################

    suppression = {
      recurrence_type = "Monthly"
      ################################################################################################################################################################
      #schedule is Optional {Required if recurrence_type is Daily, Monthly, Once or Weekly}
      ################################################################################################################################################################

      schedule = {
        start_date_utc = "2022-12-01T01:02:03Z"
        end_date_utc   = "2023-10-03T15:02:07Z"
        recurrence     = [1, 2, 5, 7, 9]
      }
    }
    ##############################################################################################################################################################
    #condition is Optional 
    ################################################################################################################################################################

    condition = {
      alert_context = {
        operator = "Equals"
        values   = ["xxxxxxxx_email@neudesic.com"]
      }
      alert_rule_id = {
        operator = "Equals"
        //alert rule has no data source, hence passing manually.
        values   = ["/subscriptions/e228a3c6-cc6e-4fea-87f3-fafa70c85d19/resourceGroups/ploceusrg000001/providers//Microsoft.AlertsManagement/ploceusactionRules000001/ploceusaction000001"]
      }
      description = {
        operator = "Equals"
        values   = ["Created by Ploceus"]
      }
      monitor = {
        operator = "Equals"
        values   = ["Resolved"]
      }
      monitor_service = {
        operator = "Equals"
        values   = ["Resource Health"]
      }
      severity = {
        operator = "Equals"
        values   = ["Sev0"]
      }
      target_resource_type = {
        operator = "Equals"
        values   = ["get"]
      }
    }
    
    description = "new action"
    enabled     = true

    tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
}
}
##############################################################################################################################################################
#subscription variables
################################################################################################################################################################

monitor_action_rule_suppression_sub_subscription_id = "e228a3c6-cc6e-4fea-87f3-fafa70c85d19"
monitor_action_rule_suppression_sub_tenant_id       = "687f51c3-0c5d-4905-84f8-97c683a5b9d1"
scope_resource_sub_subscription_id = "e228a3c6-cc6e-4fea-87f3-fafa70c85d19"
scope_resource_sub_tenant_id       = "687f51c3-0c5d-4905-84f8-97c683a5b9d1"
scope_resourcegroup_sub_subscription_id = "e228a3c6-cc6e-4fea-87f3-fafa70c85d19"
scope_resourcegroup_sub_tenant_id       = "687f51c3-0c5d-4905-84f8-97c683a5b9d1"