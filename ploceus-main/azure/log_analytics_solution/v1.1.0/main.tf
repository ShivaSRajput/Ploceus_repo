# #LOG ANALYTICS SOLUUTION RESOURCE GROUP
data "azurerm_log_analytics_workspace" "log_analytics_workspace" {
  for_each            = var.log_analytics_solution_variables
  name                = each.value.workspace_name
  resource_group_name = each.value.resource_group_name
}

#LOG ANALYTICS SOLUUTION

resource "azurerm_log_analytics_solution" "log_analytics_solution" {
  for_each              = var.log_analytics_solution_variables
  location              = each.value.location
  solution_name         = each.value.solution_name
  resource_group_name   = each.value.resource_group_name
  workspace_resource_id = data.azurerm_log_analytics_workspace.log_analytics_workspace[each.key].id
  workspace_name        = data.azurerm_log_analytics_workspace.log_analytics_workspace[each.key].name

  plan {
    publisher      = each.value.publisher
    product        = each.value.product
    promotion_code = each.value.promotion_code
  }

  tags = merge(each.value.log_analytics_solution_tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
  lifecycle { ignore_changes = [tags["Created_Time"]] }
}