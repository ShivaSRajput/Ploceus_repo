resource "azurerm_user_assigned_identity" "user_assigned_identity" {
  for_each            = var.user_assigned_identity_variables
  name                = each.value.user_assigned_identity_name
  location            = each.value.user_assigned_identity_location
  resource_group_name = each.value.user_assigned_identity_resource_group_name
  tags                = merge(each.value.user_assigned_identity_tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
  lifecycle { ignore_changes = [tags["Created_Time"]] }
}
