#Virtual Hub IP
data "azurerm_virtual_hub" "virtual_hub" {
  for_each            = var.virtual_hub_ip_variables
  name                = each.value.virtual_hub_name
  resource_group_name = each.value.resource_group_name
}

#Public IP
data "azurerm_public_ip" "public_ip" {
  for_each            = var.virtual_hub_ip_variables
  name                = each.value.public_ip_address_name
  resource_group_name = each.value.resource_group_name
}

#Gateway Subnet details 
data "azurerm_subnet" "subnet_id" {
  for_each             = var.virtual_hub_ip_variables
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.resource_group_name
}

resource "azurerm_virtual_hub_ip" "virtual_hub_ip" {
  for_each                     = var.virtual_hub_ip_variables
  name                         = each.value.name
  virtual_hub_id               = data.azurerm_virtual_hub.virtual_hub[each.key].id
  private_ip_address           = each.value.private_ip_address
  private_ip_allocation_method = each.value.private_ip_allocation_method
  public_ip_address_id         = data.azurerm_public_ip.public_ip[each.key].id
  subnet_id                    = data.azurerm_subnet.subnet_id[each.key].id
}
