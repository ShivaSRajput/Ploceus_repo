data "azurerm_resource_group" "rggroup" {
  for_each = var.search_service
  name     = lookup(each.value, "resource_group_name")
}


locals {
  resourcegroup_state_exists = false

}
resource "azurerm_search_service" "search_service" {
  for_each                      = var.search_service
  name                          = lookup(each.value, "name")
  resource_group_name           = local.resourcegroup_state_exists == false ? lookup(each.value, "resource_group_name") : data.azurerm_resource_group.rggroup.0.name
  location                      = local.resourcegroup_state_exists == false ? lookup(each.value, "resource_group_location") : data.azurerm_resource_group.rggroup.0.location
  sku                           = lookup(each.value, "sku")
  replica_count                 = lookup(each.value, "replica_count", null)
  partition_count               = lookup(each.value, "partition_count", null)
  public_network_access_enabled = lookup(each.value, "public_network_access_enabled")

  dynamic "identity" {
    for_each = coalesce(lookup(each.value, "assign_identity"), false) == false ? [] : list(coalesce(lookup(each.value, "assign_identity"), false))
    content {
      type = "SystemAssigned"
    }
  }

  tags = var.tags
}

resource "azurerm_management_lock" "search_service_lock" {
  for_each   = var.search_service
  name       = "lock ${each.value.name}"
  scope      = azurerm_search_service.search_service[each.key].id
  lock_level = "CanNotDelete"
  notes      = "Locked by Neudesic"
  depends_on = [azurerm_search_service.search_service]
}