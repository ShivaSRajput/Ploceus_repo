data "azurerm_storage_account" "storage_account" {
  for_each            = var.storage_data_lake_gen2_filesystem_variable
  name                = each.value.storage_account_name
  resource_group_name = each.value.storage_account_resource_group_name
}



resource "azurerm_storage_data_lake_gen2_filesystem" "storage_data_lake_gen2_filesystem" {
  for_each           = var.storage_data_lake_gen2_filesystem_variable
  name               = each.value.filesystem_name
  storage_account_id = data.azurerm_storage_account.storage_account[each.key].id
  owner              = each.value.filsystem.owner
  group              = each.value.filesystem.group 

  properties         = {
    key              = each.value.properties.key
  }

  dynamic "ace" {
    for_each         = each.value.ace
    content {
      permissions    = ace.value.permissions
      scope          = ace.value.scope
      type           = ace.value.type
      id             = ace.value.id
    }
  }
}