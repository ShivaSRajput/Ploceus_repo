#Storage Container module
resource "azurerm_storage_container" "storage_container" {
  for_each                           = var.storage_container_variables
  name                               = each.value.name
  storage_account_name               = each.value.storage_account_name
  container_access_type              = each.value.container_access_type
  metadata                           = each.value.metadata

}