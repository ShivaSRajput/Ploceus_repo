



data "azurerm_virtual_network" "vnet_id" {
  for_each            = var.vnets_variables
  name                = each.value.vnet_name #
  resource_group_name = each.value.resource_group_name
}

data "azurerm_subnet" "subnet_id" {
  for_each             = var.subnet_variables
  name                 = each.value.subnet_name #
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

# data "azurerm_key_vault" "example" {
#   name                = var.keyvault_name
#   resource_group_name = var.keyvault_resourcegroup
# }


resource "azurerm_private_endpoint" "this" {
  for_each            = var.private_endpoints
  name                = each.value.name                #
  resource_group_name = each.value.resource_group_name #local.resourcegroup_state_exists == true ? var.resource_group_name : data.azurerm_resource_group.this.0.name
  location            = each.value.location            #data.azurerm_resource_group.this.0.location
  subnet_id           = element(concat([for u in data.azurerm_subnet.subnet_id : u.id], [""]), 0)
  tags                = each.value.tags

  private_service_connection {
    name                           = "${each.value.name}-connection"           #
    is_manual_connection           = each.value.is_manual_connection           #
    private_connection_resource_id = each.value.private_connection_resource_id #Data Source data.azurerm_key_vault.example.id
    request_message                = each.value.request_message
    subresource_names              = each.value.subresource_names
  }
}