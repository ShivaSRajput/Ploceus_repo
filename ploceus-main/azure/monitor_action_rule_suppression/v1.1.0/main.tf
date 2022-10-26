locals {
  is_azurerm_resource_variables = { for k, v in var.monitor_action_rule_suppression_variables : k => v if lookup(v.scope, "type", null) != "ResourceGroup" }
}

locals {
  is_azurerm_resource_group_variables = { for k, v in var.monitor_action_rule_suppression_variables : k => v if lookup(v.scope, "type", null) != "Resource" }
}

data "azurerm_resources" "azure_resource" {
  provider = azurerm.scope_resource_sub
  for_each = local.is_azurerm_resource_variables
  name = each.value.scope.resource_ids
}
data "azurerm_resource_group" "resource_group" {
  provider = azurerm.scope_resourcegroup_sub
  for_each = local.is_azurerm_resource_group_variables
  name = each.value.scope.resource_ids
}
resource "azurerm_monitor_action_rule_suppression" "rule_suppression" {
  provider = azurerm.monitor_action_rule_suppression_sub
  for_each            = var.monitor_action_rule_suppression_variables
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  ################################################################################################################################################################
  #scope is optional
  ################################################################################################################################################################
  dynamic "scope" {
    for_each = each.value.scope != null ? [1] : []
    content {
      type = each.value.scope.type
      resource_ids  = [each.value.scope.type == "Resource"? data.azurerm_resources.azure_resource[each.key].resources[0].id : data.azurerm_resource_group.resource_group[each.key].id]
    }
  }
  ################################################################################################################################################################
  #suppression is required
  ################################################################################################################################################################
   suppression {

    recurrence_type = each.value.suppression.recurrence_type  #recurrence_type - (Required) Specifies the type of suppression.
                                                              # Possible values are Always, Daily, Monthly, Once, and Weekly.
  ################################################################################################################################################################
  #schedule is Optional {Required if recurrence_type is Daily, Monthly, Once or Weekly}
  ################################################################################################################################################################
    dynamic "schedule" {
      for_each = each.value.suppression.recurrence_type != "Always" ? [1] : []
      content {
        start_date_utc = each.value.suppression.schedule.start_date_utc
        end_date_utc = each.value.suppression.schedule.end_date_utc
        recurrence_weekly  = each.value.suppression.recurrence_type == "Weekly" ? each.value.suppression.schedule.recurrence : null
        recurrence_monthly  = each.value.suppression.recurrence_type == "Monthly" ? each.value.suppression.schedule.recurrence : null
      }
    }
  }
  ################################################################################################################################################################
  #condition is Optional 
  ################################################################################################################################################################
  
   dynamic "condition" {
    for_each = each.value.condition == null ? [] : [1]
    content{
    alert_context {
      operator = each.value.condition.alert_context.operator
      values   = each.value.condition.alert_context.values
    }

    alert_rule_id {
      operator = each.value.condition.alert_rule_id.operator
      values   = each.value.condition.alert_rule_id.values
    }

    description {
      operator = each.value.condition.description.operator
      values   = each.value.condition.description.values
    }

    monitor {
      operator = each.value.condition.monitor.operator
      values   = each.value.condition.monitor.values
    }

    monitor_service {
      operator = each.value.condition.monitor_service.operator
      values   = each.value.condition.monitor_service.values
    }

    severity {
      operator = each.value.condition.severity.operator
      values   = each.value.condition.severity.values
    }
   target_resource_type {
      operator = each.value.condition.target_resource_type.operator
      values   = each.value.condition.target_resource_type.values
    }
    }
   }
  tags = merge(each.value.tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
}
