

data "azurerm_virtual_hub" "virtual_hub" {
  for_each            = var.express_route_gateway
  name                = each.value.virtual_hub_id
  resource_group_name = each.value.resource_group_name
  
}


resource "azurerm_express_route_gateway" "express_route_gateway" {
  for_each            = var.express_route_gateway
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  virtual_hub_id      = data.azurerm_virtual_hub.virtual_hub[each.key].id 
  scale_units         = each.value.scale_units
  depends_on = [
    data.azurerm_virtual_hub.virtual_hub
  ]
  tags = merge(each.value.express_route_gateway_tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
  lifecycle { ignore_changes = [tags["Created_Time"]] }
}