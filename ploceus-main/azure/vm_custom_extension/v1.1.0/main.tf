#VIRTUAL_MACHINE_CUSTOM_EXTENSION
data "azurerm_virtual_machine" "virtual_machine" {
  for_each            = var.virtual_machine_extension_variables
  name                = each.value.virtual_machine_name
  resource_group_name = each.value.resource_group_name
}


resource "azurerm_virtual_machine_extension" "virtual_machine_extension" {
  for_each                   = var.virtual_machine_extension_variables
  name                       = each.value.name
  virtual_machine_id         = data.azurerm_virtual_machine.virtual_machine[each.key].id
  publisher                  = each.value.publisher
  type                       = each.value.type
  type_handler_version       = each.value.type_handler_version
  auto_upgrade_minor_version = each.value.auto_upgrade_minor_version
  automatic_upgrade_enabled  = each.value.automatic_upgrade_enabled

  settings = each.value.custom_extension_settings


  protected_settings = each.value.custom_extension_protected_settings

  tags = merge(each.value.virtual_machine_extension_tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
  lifecycle { ignore_changes = [tags["Created_Time"]] }
}
