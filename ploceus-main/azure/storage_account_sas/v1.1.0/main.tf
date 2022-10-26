data "azurerm_storage_account" "storage_account" {
  for_each            = var.storage_account_sas_variables
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_storage_account_sas" "storage_account_sas" {
  for_each          = var.storage_account_sas_variables
  connection_string = data.azurerm_storage_account.storage_account[each.key].primary_connection_string
  https_only        = each.value.https_only
  signed_version    = each.value.signed_version

  dynamic "resource_types" {
    for_each = each.value.resource_types != null ? each.value.resource_types : []
    content {
      service   = resource_types.value.service
      container = resource_types.value.container
      object    = resource_types.value.object
    }
  }

  dynamic "services" {
    for_each = each.value.services != null ? each.value.services : []
    content {
      blob  = services.value.blob
      queue = services.value.queue
      table = services.value.table
      file  = services.value.file
    }
  }
  start  = each.value.start
  expiry = each.value.expiry

  dynamic "permissions" {
    for_each = each.value.permissions != null ? each.value.permissions : []
    content {
      read    = permissions.value.read
      write   = permissions.value.write
      delete  = permissions.value.delete
      list    = permissions.value.list
      add     = permissions.value.add
      create  = permissions.value.create
      update  = permissions.value.update
      process = permissions.value.process
      tag     = permissions.value.tag
      filter  = permissions.value.filter
    }
  }
}
