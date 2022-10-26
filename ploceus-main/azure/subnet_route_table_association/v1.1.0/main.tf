#Subnet Data
data "azurerm_subnet" "subnet" {
  for_each             = var.subnet_route_table_association_variables
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

#Route Table Data
data "azurerm_route_table" "route_table" {
  for_each            = var.subnet_route_table_association_variables
  name                = each.value.route_table_name
  resource_group_name = each.value.resource_group_name
}


# Subnet -> Route Table Association
resource "azurerm_subnet_route_table_association" "subnet_route_table_association" {
  for_each       = var.subnet_route_table_association_variables
  subnet_id      = data.azurerm_subnet.subnet[each.key].id
  route_table_id = data.azurerm_route_table.route_table[each.key].id
}

