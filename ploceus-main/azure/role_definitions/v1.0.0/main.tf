# This module helps to create role definitions
data "azurerm_subscription" "primary" {
}

resource "azurerm_role_definition" "role_definition" {
  for_each            = var.role_definition_variables
  name                = each.value.name
  scope               = data.azurerm_subscription.primary.id
  description         = each.value.description

  permissions {
    actions           = each.value.permissions.actions
    not_actions       = each.value.permissions.not_actions
    data_actions      = each.value.permissions.data_actions
    not_data_actions  = each.value.permissions.not_data_actions
  }

  assignable_scopes   = each.value.assignable_scopes
    #can be at management group, subscription, RG and resource level
    #data.azurerm_subscription.primary.id, # /subscriptions/00000000-0000-0000-0000-000000000000
  
}



