resource "azurerm_cognitive_account" "cognitive_services" {
  for_each            = var.cognitive_account
  name                = lookup(each.value, "name")
  resource_group_name = local.resourcegroup_state_exists == false ? lookup(each.value, "resource_group_name") : data.azurerm_resource_group.rggroup.0.name
  location            = local.resourcegroup_state_exists == false ? lookup(each.value, "resource_group_location") : data.azurerm_resource_group.rggroup.0.location
  kind                = lookup(each.value, "kind")

  sku_name = lookup(each.value, "sku_name")

  tags = var.tags
}